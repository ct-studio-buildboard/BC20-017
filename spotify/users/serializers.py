from rest_framework import serializers
from . import models

class UserTotalScoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.CustomUser
        fields = ('email', 'total_score', )
