from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from pet.models import Pet
from bid.serializer import BidSerializer, BidResponseSerializer
from pet.models import StatusType
from bid.models import Bid
import moneyed


class BidApi(APIView):
    class_serializer = BidSerializer()
    permission_classes = (
        IsAuthenticated,
    )

    def post(self, request, id, format=None):
        serializer = BidSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        try:
            pet = Pet.objects.get(id=id)
        except Pet.DoesNotExist:
            return Response(data={"detail": "Pet id doesn\'t exists"}, status=status.HTTP_400_BAD_REQUEST)
        if pet.status != StatusType.AVAILABLE.value:
            return Response(data={"detail": "Pet is not available for bidding"}, status=status.HTTP_400_BAD_REQUEST)
        if pet.owner.id == request.user.id:
            return Response(data={"detail": "Pet owner cannot bid on his own pet"}, status=status.HTTP_400_BAD_REQUEST)
        bid = Bid(pet=pet, owner=request.user, amount=moneyed.Money(request.data['amount'], currency='USD'))
        bid.save()
        return Response(data=BidResponseSerializer(bid).data, status=status.HTTP_201_CREATED)
