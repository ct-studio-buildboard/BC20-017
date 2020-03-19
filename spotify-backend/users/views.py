# users/views.py
from django.http import HttpResponse
from django.core.exceptions import ValidationError

from rest_framework import generics
from rest_framework.response import Response

from . import models
from . import serializers

def test_view(request):
    return HttpResponse("hello guysssss")