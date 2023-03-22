from distutils.command.upload import upload
import os
from pyexpat import model
from django.db import models
import datetime
from django.contrib.auth.models import User

 #Create your models here.


def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (timeNow, old_filename)
    return os.path.join('uploads/', filename)

class leaf_images(models.Model):
    img_id = models.AutoField(primary_key=True)
    image = models.ImageField(upload_to =filepath,null=True,blank= True)
    img_date = models.DateField(auto_now_add=True)
    #disease2 = models.ForeignKey(leaf_dis,on_delete=models.CASCADE)

class leaf_dis(models.Model):
    disease_id = models.AutoField(primary_key=True)
    disease_name = models.CharField(max_length=200)
    disease_look = models.TextField(max_length=1000)
    disease_epidemic = models.TextField(max_length=1000)
    disease_prevent = models.TextField(max_length=1000)
    disease_image = models.ImageField(null=True,blank=True)
    dateCreated = models.DateTimeField(auto_now_add=True,null=True)

class historys(models.Model):
    hist_id =models.AutoField(primary_key=True)
    hist_date = models.DateField(auto_now_add=True)
    leafType = models.CharField(max_length=200,null=True)
    statusLeaf = models.CharField(max_length=200,null=True)
    diseaseOc = models.CharField(max_length=200,null=True)
    scoreDisease = models.DecimalField(max_length=200,max_digits=5,decimal_places=2,null=True)
    pub_date = models.CharField(max_length=100,null=True)
    hist_img_path = models.ImageField(upload_to =filepath,null=True,blank= True)
    user1 = models.ForeignKey(User,on_delete=models.CASCADE)
    
 