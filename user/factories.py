from factory import DjangoModelFactory, Faker, post_generation
from user.models import User
from rest_framework.authtoken.models import Token


class UserFactory(DjangoModelFactory):
    phone = Faker('phone_number')
    email = Faker("email")
    first_name = Faker("first_name")
    last_name = Faker("last_name")
    username = Faker("name")

    @post_generation
    def create_token(self, create: bool, extracted, **kwargs):
        Token.objects.get_or_create(user=self)

    class Meta:
        model = User
        django_get_or_create = ["username"]
