from django.db import models
        
class CustomUser(models.Model):
    test = models.IntegerField(default = 0)