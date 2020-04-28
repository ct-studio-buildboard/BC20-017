# users/views.py
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from django.core.exceptions import ValidationError

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import UserInfo, GroupInfo, GroupMember, Following

import json

@csrf_exempt
@api_view(['POST'])
def login(request):
    user = UserInfo.objects.filter(userName = request.POST['userName'])
    # If user does not exist, create a profile for the new user
    if (user.exists() == False):
        new_user = UserInfo(userName = request.POST['userName'])
        new_user.save()

    return Response(request.POST['userName'], status = status.HTTP_201_CREATED)

@csrf_exempt
@api_view(['POST'])
def follow(request):
    follow_relation = Following.objects.filter(userInfo = request.POST['userInfo'], followingUserInfo = request.POST['followingUserInfo'])
    # If follow relation does not exist, create a follow relation
    if (follow_relation.exists() == False):
        userInfo = UserInfo.objects.get(userName = request.POST['userInfo'])
        followingUserInfo = UserInfo.objects.get(userName = request.POST['followingUserInfo'])

        new_follow_relation = Following.objects.create(userInfo = userInfo, followingUserInfo = followingUserInfo)
        new_follow_relation.save()

    return Response({'userName':request.POST['userInfo'], 'followingUserInfo':request.POST['followingUserInfo']}, status=status.HTTP_201_CREATED)

@csrf_exempt
@api_view(['GET'])
def init_creation(request, userInfo):
    # Returns all the following users
    following_users = Following.objects.filter(userInfo = userInfo).values("followingUserInfo_id")
    return Response(following_users)

@csrf_exempt
@api_view(['POST'])
def create_group(request):
    received_json_data=json.loads(request.body)
    group = GroupInfo.objects.filter(groupName = received_json_data['groupName'])

    # Alter name until group name does not exist
    groupName = received_json_data['groupName']
    while (group.exists() == True):
        groupName = groupName + '1'
        group = GroupInfo.objects.filter(groupName = groupName)
        
    # If group does not exist, creates the group
    if (group.exists() == False):
        # Updates the GroupInfo table
        new_group = GroupInfo(groupName = received_json_data['groupName'], groupDesc = received_json_data['groupDesc'])
        new_group.save()

        # Updates the GroupMember table
        group_creator = UserInfo.objects.get(userName = received_json_data['userName'])
        new_group_member = GroupMember.objects.create(userInfo = group_creator, groupInfo = new_group, pendingStatus = False)
        new_group_member.save()

        for member_name in received_json_data['members']:
            group_member = UserInfo.objects.get(userName = member_name)
            new_group_member = GroupMember.objects.create(userInfo = group_member, groupInfo = new_group, pendingStatus = True)
            new_group_member.save()

    return Response(received_json_data['members'], status = status.HTTP_201_CREATED)

@csrf_exempt
@api_view(['GET'])
def get_group(request, groupName):
    group = GroupInfo.objects.get(groupName = groupName)

    # Build a list of users in the group using GroupMember table
    group_members = GroupMember.objects.filter(groupInfo_id = groupName).values("userInfo_id", "pendingStatus")
    return Response({"groupName": group.groupName, "groupDesc": group.groupDesc, "members": group_members})

@csrf_exempt
@api_view(['GET'])
def get_groups(request, userName):
    # Get all groups that the user belongs to
    user_groups = GroupMember.objects.filter(userInfo_id = userName)

    # Build Group Information for each group
    groups_info = []
    for user_group in user_groups:
        # Getting the information for each group that user belongs to
        group = GroupInfo.objects.get(groupName = user_group.groupInfo_id)

        # Build a list of users in the group
        group_members = GroupMember.objects.filter(groupInfo_id = group.groupName).values("userInfo_id", "pendingStatus")

        # Building a group info to be returned
        group_info = {"groupName": group.groupName, "groupDesc": group.groupDesc, "members": group_members, "pendingStatus": user_group.pendingStatus}
        groups_info.append(group_info)

    return Response(groups_info)

@csrf_exempt
@api_view(['GET'])
def get_notification(request, userName):
    # Get all groups that the user belongs to
    user_groups = GroupMember.objects.filter(userInfo_id = userName)

    # Build Group Information for each group (only when it's pendingStatus for the user)
    groups_info = []
    for user_group in user_groups:
        if (user_group.pendingStatus == True):
            # Getting the information for each group that user belongs to
            group = GroupInfo.objects.get(groupName = user_group.groupInfo_id)

            # Build a list of users in the group
            group_members = GroupMember.objects.filter(groupInfo_id = group.groupName).values("userInfo_id", "pendingStatus")

            # Building a group info to be returned
            group_info = {"groupName": group.groupName, "groupDesc": group.groupDesc, "members": group_members}
            groups_info.append(group_info)

    return Response(groups_info)

@csrf_exempt
@api_view(['POST'])
def accept_invitation(request):
    # Update the pending status of the user in the group to be False
    group_member_info = GroupMember.objects.get(userInfo_id = request.POST['userName'], groupInfo_id = request.POST['groupName'])
    group_member_info.pendingStatus = False
    group_member_info.save(update_fields=['pendingStatus'])

    return Response({'userName': request.POST['userName'], 'groupName': request.POST['groupName']}, status = status.HTTP_202_ACCEPTED)

@csrf_exempt
@api_view(['POST'])
def decline_invitation(request):
    # Since user is declining the invitation, delete it from the GroupMember table
    group_member_info = GroupMember.objects.get(userInfo_id = request.POST['userName'], groupInfo_id = request.POST['groupName'])
    group_member_info.delete()

    return Response({'userName': request.POST['userName'], 'groupName': request.POST['groupName']}, status = status.HTTP_202_ACCEPTED)