# Generated by Django 4.0 on 2022-07-24 12:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0005_leaf_images_img_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='leaf_images',
            name='img_path',
        ),
    ]
