from django.db import models
from model_utils.models import SoftDeletableModel, TimeStampedModel
from user.models import User
from pet.models import Pet
from djmoney.models.fields import MoneyField


# Create your models here.


class Bid(TimeStampedModel, SoftDeletableModel):
    owner = models.ForeignKey(User, blank=False, null=False, on_delete=models.CASCADE, default=None)
    pet = models.ForeignKey(Pet, blank=False, null=False, on_delete=models.CASCADE, default=None)
    amount = MoneyField(max_digits=12, decimal_places=2, default='0 USD', null=False)

    def __str__(self):
        return "Bid by{} amount:{} on pet:{}".format(self.owner, self.amount, self.pet)
