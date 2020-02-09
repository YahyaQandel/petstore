from factory import DjangoModelFactory, Faker, SubFactory
from pet.models import Pet
from category.factories import CategoryFactory
from user.factories import UserFactory


class PetFactory(DjangoModelFactory):
    category = SubFactory(CategoryFactory)
    owner = SubFactory(UserFactory)
    name = Faker('first_name')
    photoUrl = Faker('url')

    class Meta:
        model = Pet
