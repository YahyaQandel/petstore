from rest_framework import serializers
from user.serializer import UserSerializer


class BidSerializer(serializers.Serializer):
    amount_errors = {'required': 'The amount field is required.'}
    amount = serializers.DecimalField(required=True, error_messages=amount_errors, max_digits=12, decimal_places=2)


class BidResponseSerializer(serializers.Serializer):
    user = UserSerializer(source='owner')
    amount = serializers.CharField()
