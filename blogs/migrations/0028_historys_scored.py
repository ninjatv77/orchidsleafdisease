# Generated by Django 4.0 on 2022-10-20 03:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0027_historys_diseaseoc_historys_leaftype_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='historys',
            name='scoreD',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
