from rest_framework import serializers


class LoginRequestSerializer(serializers.Serializer):
    email = serializers.CharField()
    password = serializers.CharField()


class ResponseSerializer(serializers.Serializer):
    id = serializers.CharField()
    token = serializers.CharField()
