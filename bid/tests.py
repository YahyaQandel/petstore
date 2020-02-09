from unittest import TestCase

from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APIClient
from user.factories import UserFactory
from user.models import User
from pet.factories import PetFactory
from pet.models import Pet, StatusType
from tag.factories import TagFactory
from category.factories import CategoryFactory

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
        self.request_headers = get_request_authentication_headers(self.user)

    def testBidOnNonExistantPet(self):
        response = self.api_client.post(BID_URL.format(12), data={}, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Pet id doesn\'t exists')

    def testBidWithNonAuthenticatedUser(self):
        self.request_headers = {}
        response = self.api_client.post(BID_URL.format(0), data={}, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 401)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Authentication credentials were not provided.')

    def testBidOnNotAvailablePet(self):
        pet = PetFactory()
        pet.status = StatusType.SOLD
        pet.save()
        response = self.api_client.post(BID_URL.format(pet.id), data={}, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Pet is not available for bidding')
        Pet.objects.filter(id=pet.id).delete()

    def testBidByPetOwner(self):
        pet = PetFactory()
        response = self.api_client.post(BID_URL.format(pet.id), data={}, **self.request_headers)
        response_data = response.json()
        self.assertEquals(response.status_code, 400)
        self.assertIn('detail', response_data)
        self.assertEquals(response_data['detail'], 'Pet owner cannot bid on his own pet')
