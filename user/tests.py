from django.test import TestCase
from rest_framework.test import APIClient
from user.factories import UserFactory
from rest_framework.authtoken.models import Token


# Create your tests here.


class TestUser(TestCase):
    LOGIN_URL = '/v2/oauth/token'

    def setUp(self):
        self.client = APIClient()
        self.user = UserFactory()
        self.user_password = 'test_password'
        self.user.set_password(self.user_password)
        self.user.save()

    def testUserLoginSucceed(self):
        data = {
            'email': self.user.email,
            'password': self.user_password,
        }
        response = self.client.post(self.LOGIN_URL, data)
        self.assertEqual(response.status_code, 200)
        response_data = response.json()
        self.assertIn('id', response_data)
        self.assertIn('token', response_data)
        user_token = Token.objects.get(key=response_data['token'])
        self.assertEquals(response_data['token'], user_token.key)

    def testUserLoginFailedWithInvalidCredentials(self):
        data = {
            'email': self.user.email,
            'password': "wrong_password",
        }
        response = self.client.post(self.LOGIN_URL, data)
        self.assertEqual(response.status_code, 401)
        response_data = response.json()
        self.assertIn('error', response_data)
        self.assertIn('message', response_data)
        self.assertEquals(response_data['message'], "The user credentials were incorrect.")