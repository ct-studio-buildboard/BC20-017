# Generated by Django 2.1.1 on 2020-04-09 08:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spotify_profile', '0003_auto_20200409_0636'),
    ]

    operations = [
        migrations.AddField(
            model_name='groupinfo',
            name='groupDesc',
            field=models.TextField(default=''),
        ),
    ]
