from factory import DjangoModelFactory, Faker
from category.models import Category


class CategoryFactory(DjangoModelFactory):
    name = 'TestCategory'

    class Meta:
        model = Category
