# Generated by Django 4.0 on 2022-10-20 03:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0026_historys_pub_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='historys',
            name='diseaseOc',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='historys',
            name='leafType',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='historys',
            name='statusLeaf',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
