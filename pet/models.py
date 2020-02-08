from django.db import models
from model_utils.models import SoftDeletableModel
from category.models import Category
from tag.models import Tag

# Create your models here.
AVAILABLE = "0"
PENDING = "1"
SOLD = "2"

STATUS_TYPE = (
    (AVAILABLE, "available"), (PENDING, "pending"), (SOLD, "sold"))


class Pet(SoftDeletableModel):
    category = models.ForeignKey(Category, blank=False, null=False, on_delete=models.PROTECT)
    name = models.CharField("Pet Name", blank=True, null=False, max_length=255)
    tag = models.ManyToManyField(Tag, blank=False, null=False, related_name='pet_tags')
    status = models.CharField(max_length=30, choices=STATUS_TYPE, default=AVAILABLE)
