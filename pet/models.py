from django.db import models
from model_utils.models import SoftDeletableModel, TimeStampedModel
from category.models import Category
from tag.models import Tag
from user.models import User
from enum import Enum, IntEnum


class StatusType(IntEnum):
    AVAILABLE = 0
    PENDING = 1
    SOLD = 2


class Pet(SoftDeletableModel):
    category = models.ForeignKey(Category, blank=False, null=False, on_delete=models.CASCADE)
    name = models.CharField("Pet Name", blank=True, null=False, max_length=255)
    tag = models.ManyToManyField(Tag, blank=False, related_name='pet_tags')
    status = models.IntegerField(default=int(StatusType.AVAILABLE))
    photoUrl = models.CharField(max_length=1000, null=False, default=None)
    owner = models.ForeignKey(User, blank=False, null=False, on_delete=models.CASCADE, default=None)

    def __str__(self):
        return "{}/{}, {}".format(self.name, self.category, self.status)
