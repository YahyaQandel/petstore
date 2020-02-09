from unittest import TestCase

from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APIClient
from user.factories import UserFactory
from user.models import User
from pet.factories import PetFactory
from pet.models import Pet, StatusType
from bid.models import Bid
import moneyed

TOKEN_TYPE = 'Bearer'
BID_URL = '/v2/pet/{}/bid'
PET_BIDS = '/v2/pet/{}/bid'


def get_request_authentication_headers(user):
    user_token = Token.objects.get(user_id=user.id)
    request_headers = {'HTTP_AUTHORIZATION': '{} {}'.format(TOKEN_TYPE, user_token)}
    return request_headers


class TestBid(TestCase):
    def setUp(self):
        self.api_client = APIClient()
        self.user = UserFactory()
        self.pet = PetFactory()
        self.request_headers = get_request_authentication_headers(self.user)
        self.data = {'amount': "10.00"}

    def testBidOnNonExistingPet(self):
        response = self.api_client.post(BID_URL.format(12), data=self.data, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Pet id doesn\'t exists')

    def testBidWithNonAuthenticatedUser(self):
        self.request_headers = {}
        response = self.api_client.post(BID_URL.format(0), data=self.data, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 401)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Authentication credentials were not provided.')

    def testBidOnNotAvailablePet(self):
        self.pet.status = StatusType.SOLD
        self.pet.save()
        response = self.api_client.post(BID_URL.format(self.pet.id), data=self.data, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Pet is not available for bidding')
        # Pet.objects.filter(id=self.pet.id).delete()

    def testBidByPetOwner(self):
        self.request_headers = get_request_authentication_headers(self.pet.owner)
        response = self.api_client.post(BID_URL.format(self.pet.id), data=self.data, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Pet owner cannot bid on his own pet')

    def testBidRequestBodyValidation(self):
        response = self.api_client.post(BID_URL.format(self.pet.id), data={}, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('amount', response_data)
        self.assertEquals(response_data['amount'][0], 'The amount field is required.')

    def testBid(self):
        bidder = UserFactory()
        self.request_headers = get_request_authentication_headers(bidder)
        response = self.api_client.post(BID_URL.format(self.pet.id), data=self.data, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 201)
        bid = Bid.objects.get(pet=self.pet)
        self.assertEquals(bidder.id, response_data['user']['id'])
        self.assertEquals(bid.amount, moneyed.Money(self.data['amount'], currency='USD'))

    def testGetBidsByNotOwner(self):
        pet = PetFactory()
        self.request_headers = get_request_authentication_headers(self.user)
        response = self.api_client.get(PET_BIDS.format(pet.id), **self.request_headers)
        response_data = response.json()
        self.assertEqual(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], "Current user is not authorized to view bids on this pet")

    def testGetBids(self):
        pet = PetFactory()
        user_one = UserFactory()
        user_two = UserFactory()
        user_three = UserFactory()
        user_four = UserFactory()
        user_one_bid_amount = 100.00
        user_two_bid_amount = 500.00
        user_three_bid_amount = 280.00
        user_four_bid_amount = 320.00
        first_bid = Bid(pet=pet, owner=user_one, amount=moneyed.Money(user_one_bid_amount, currency='USD'))
        second_bid = Bid(pet=pet, owner=user_two, amount=moneyed.Money(user_two_bid_amount, currency='USD'))
        third_bid = Bid(pet=pet, owner=user_three, amount=moneyed.Money(user_three_bid_amount, currency='USD'))
        fourth_bid = Bid(pet=pet, owner=user_four, amount=moneyed.Money(user_four_bid_amount, currency='USD'))
        first_bid.save()
        second_bid.save()
        third_bid.save()
        fourth_bid.save()
        self.request_headers = get_request_authentication_headers(pet.owner)
        response = self.api_client.get(PET_BIDS.format(pet.id), **self.request_headers)
        response_data = response.json()
        self.assertEqual(response.status_code, 200)
        self.assertEquals(response_data[0]['amount'], "${:.2f}".format(user_one_bid_amount))
        self.assertEquals(response_data[0]['user']['email'], user_one.email)

        self.assertEquals(response_data[1]['amount'], "${:.2f}".format(user_two_bid_amount))
        self.assertEquals(response_data[1]['user']['email'], user_two.email)

        self.assertEquals(response_data[2]['amount'], "${:.2f}".format(user_three_bid_amount))
        self.assertEquals(response_data[2]['user']['email'], user_three.email)

        self.assertEquals(response_data[3]['amount'], "${:.2f}".format(user_four_bid_amount))
        self.assertEquals(response_data[3]['user']['email'], user_four.email)

    def tearDown(self):
        Bid.objects.all().delete()
        Pet.objects.all().delete()
        User.objects.all().delete()
