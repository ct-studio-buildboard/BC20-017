from django.urls import include, path, re_path

from spotify_profile.views import *

urlpatterns = [
    # LOG IN PAGE
    path('login/', login),

    # HOME PAGE
    path('getNotification/<str:userName>/', get_notification),
    path('acceptInvitation/', accept_invitation),
    path('declineInvitation/', decline_invitation),

    # LIBRARY PAGE
    path('initCreation/<str:userInfo>/', init_creation),
    path('createGroup/', create_group),
    path('getGroup/<str:groupName>/', get_group),
    path('getGroups/<str:userName>/', get_groups),

    # GROUP PAGE

    # MISC
    path('follow/', follow)
]