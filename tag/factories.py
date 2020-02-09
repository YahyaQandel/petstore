from factory import DjangoModelFactory, Faker
from tag.models import Tag


class TagFactory(DjangoModelFactory):
    name = 'TestTag'

    class Meta:
        model = Tag
