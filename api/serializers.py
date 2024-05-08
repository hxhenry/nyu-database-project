from rest_framework import serializers
from accounts.models import Account, , Review
from users.models import Profile





class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = '__all__'





class AccountSerializer(serializers.ModelSerializer):
    owner = ProfileSerializer(many=False)
    tags = TagSerializer(many=True)
    reviews = serializers.SerializerMethodField()

    class Meta:
        model = Account
        fields = '__all__'

