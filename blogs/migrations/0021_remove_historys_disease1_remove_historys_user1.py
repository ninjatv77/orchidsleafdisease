# Generated by Django 4.0 on 2022-09-18 14:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0020_rename_history_historys'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='historys',
            name='disease1',
        ),
        migrations.RemoveField(
            model_name='historys',
            name='user1',
        ),
    ]
