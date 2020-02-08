from factory import DjangoModelFactory, Faker
from user.models import User


class UserFactory(DjangoModelFactory):
    phone = Faker('phone_number')
    email = Faker("email")
    first_name = Faker("name")
    last_name = Faker("name")

    class Meta:
        model = User
