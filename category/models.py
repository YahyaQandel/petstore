from django.db import models
from model_utils.models import SoftDeletableModel


# Create your models here.
class Category(SoftDeletableModel):
    name = models.CharField("Category Name", blank=True, null=False, max_length=255)

