from django.db import models
from model_utils.models import SoftDeletableModel


# Create your models here.
class Tag(SoftDeletableModel):
    name = models.CharField("Tag Name", blank=True, null=False, max_length=255)

