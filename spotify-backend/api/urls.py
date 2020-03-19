from django.urls import include, path, re_path

from users.views import test_view

urlpatterns = [
    path('test/', test_view),
]