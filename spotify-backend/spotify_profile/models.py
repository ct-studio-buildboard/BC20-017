from django.db import models
        
class UserInfo(models.Model):
    userName = models.CharField(primary_key=True, max_length=255)

class GroupInfo(models.Model):
    groupName = models.CharField(primary_key=True, max_length=255)
    groupDesc = models.TextField(default='')

class GroupMember(models.Model):
    userInfo = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    groupInfo = models.ForeignKey(GroupInfo, on_delete=models.CASCADE)
    pendingStatus = models.BooleanField(default='')

class Following(models.Model):
    userInfo = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name="followerUserName")
    followingUserInfo = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name="followingUserName")