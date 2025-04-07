from rest_framework import serializers
from .models import Question, Option, Response, ResponseDetail, Certificate

class OptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Option
        fields = ['option_id', 'value']

class QuestionSerializer(serializers.ModelSerializer):
    options = OptionSerializer(many=True, read_only=True) 

    class Meta:
        model = Question
        fields = '__all__' 

class ResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Response
        fields = '__all__'

class ResponseDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = ResponseDetail
        fields = '__all__'

class CertificateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Certificate
        fields = '__all__'