from rest_framework import serializers


class BidSerializer(serializers.Serializer):
    amount_errors = {'required': 'The amount field is required.'}
    pet = serializers.IntegerField()
    amount = serializers.DecimalField(required=True, error_messages=amount_errors, max_digits=12, decimal_places=2)
