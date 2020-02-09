from unittest import TestCase

from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APIClient
from user.factories import UserFactory
from user.models import User
from pet.factories import PetFactory
from pet.models import Pet, StatusType
from bid.models import Bid

TOKEN_TYPE = 'Bearer'
BID_URL = '/v2/pet/{}/bid'


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

    def testBidOnNonExistantPet(self):
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
        self.assertEquals(bid.id, response_data['id'])
        self.assertEquals(response_data['amount'], "${}".format(self.data['amount']))

    def tearDown(self):
        Bid.objects.all().delete()
        Pet.objects.all().delete()
        User.objects.all().delete()
