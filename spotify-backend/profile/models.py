from django.db import models
        
class User(models.Model):
    test = models.IntegerField(default = 0)

class Group(models.Model):
    test = models.IntegerField(default = 0)