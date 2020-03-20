from django.urls import include, path, re_path

from profile.views import test_view

urlpatterns = [
    path('test/', test_view),
    # path('login/', login), 
    # path('init_group/', init_group),
    # path('create_group/', create_group),  
]