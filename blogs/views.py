from calendar import HTMLCalendar, calendar
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.preprocessing.image import ImageDataGenerator, load_img
from tensorflow.keras.models import load_model
from tensorflow.keras.models import model_from_json
from IPython.display import Image
from tensorflow.keras.optimizers import Adam
import h5py


import matplotlib.pyplot as plt
import numpy as np
import pytz


import requests
import PIL
import pickle as p
import pathlib
from io import BytesIO

from audioop import add
from email import message
from multiprocessing import context
from queue import Empty
from urllib import request
from django.shortcuts import render,redirect
from django.core.paginator import Paginator,EmptyPage
from django.contrib.auth.models import User,auth
from django.contrib import messages 
from django.contrib.messages.views import SuccessMessageMixin #Using to(insert)
from .models import leaf_dis, leaf_images,historys,User
from django.db.models.functions import Lower
from django.core.files.storage import FileSystemStorage
from .filters import hisFilter
import os
import datetime
import random
import string






# Create your views here.

def timenows():
    now1 = datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
    month_name = 'x มกราคม กุมภาพันธ์ มีนาคม เมษายน พฤษภาคม มิถุนายน กรกฎาคม สิงหาคม กันยายน ตุลาคม พฤศจิกายน ธันวาคม'.split()[now1.month]
    thai_year = now1.year + 543
    time_str = now1.strftime('%H:%M:%S')
    return "%d %s %d %s"%(now1.day, month_name, thai_year, time_str) # 6 ตุลาคม 2565 10:24:30 08/20/2000

def home(request):
    return render(request,'index.html')
def loginForm(request):
    if request.session.get('username', False):
        return render(request,'insert.html')
    else:
        return render(request,'login.html')

   
def register(request):
    return render(request,'register.html')
def history(request):
    if request.session.get('username',False):
        user= User.objects.get(username=request.session['username'])
        dSL =request.GET.getlist('diseaseSL')
        dSLt=request.GET.get('diseaseSL')
        dates= request.GET.get('dates')
        iduserck = user.id
        hist_img_path = historys.objects.filter(user1_id=iduserck).order_by('-hist_date')

   

        # if dSL==['0']:
        #     hist_img_path = historys.objects.filter(user1_id=iduserck).order_by('-hist_date')
                
        # elif dSLt==('โรคเน่า'):
        #     hist_img_path = historys.objects.filter(user1_id=iduserck,diseaseOc=dSLt).order_by('-hist_date')
                
        # elif dSLt==('โรคเน่าดำ'):
        #     hist_img_path = historys.objects.filter(user1_id=iduserck,diseaseOc=dSLt).order_by('-hist_date')
                
        # elif dSLt==('โรคใบปื้นเหลือง'):
        #     hist_img_path = historys.objects.filter(user1_id=iduserck,diseaseOc=dSLt).order_by('-hist_date')

        # elif dSLt==('ไม่ใช่ใบกล้วยไม้'):
        #     hist_img_path = historys.objects.filter(user1_id=iduserck,leafType=dSLt).order_by('-hist_date')

        # elif request.GET.get('fromDate') != ('None') and request.GET.get('toDate') != ('None'):
        #     if request.GET.get('fromDate') == None and request.GET.get('toDate') == None:
        #         fromDate = ('2022-01-01')
        #         toDate = datetime.datetime.now()
        #         context= {'fromDate':fromDate,'toDate':toDate}
        #         hist_img_path = historys.objects.filter(user1_id=iduserck,hist_date__range=[fromDate,toDate]).order_by('-hist_date')
        #         p = Paginator(hist_img_path, 5) 
        #         page_num = request.GET.get('page',1)
        #         try:
        #             page = p.page(page_num)
        #         except EmptyPage:
        #             page = p.page(1)

                
        #         context = {'images':page,'dSLt':dSLt}
        #         return render(request,'history.html',context)
                        
                                
        #     elif request.GET.get('fromDate') == None:
        #         fromDate = ('2022-01-01')
        #         toDate = request.GET.get('toDate')
        #         context= {'fromDate':fromDate,'toDate':toDate}
        #         hist_img_path = historys.objects.filter(user1_id=iduserck,hist_date__range=[fromDate,toDate]).order_by('-hist_date')
        #         p = Paginator(hist_img_path, 5) 
        #         page_num = request.GET.get('page',1)
        #         try:
        #             page = p.page(page_num)
        #         except EmptyPage:
        #             page = p.page(1)

                
        #         context = {'images':page,'dSLt':dSLt}
        #         return render(request,'history.html',context)
                        
                                
        #     elif request.GET.get('toDate') == None:
        #         fromDate = request.GET.get('fromDate')
        #         toDate = datetime.datetime.now()
        #         context= {'fromDate':fromDate,'toDate':toDate}
        #         hist_img_path = historys.objects.filter(user1_id=iduserck,hist_date__range=[fromDate,toDate]).order_by('-hist_date')
        #         p = Paginator(hist_img_path, 5) 
        #         page_num = request.GET.get('page',1)
        #         try:
        #             page = p.page(page_num)
        #         except EmptyPage:
        #             page = p.page(1)

                
        #         context = {'images':page,'dSLt':dSLt}
        #         return render(request,'history.html',context)
                        
                                
        #     elif request.GET.get('fromDate') != None and request.GET.get('toDate') != None:
                
        #         fromDate = request.GET.get('fromDate')
        #         toDate = request.GET.get('toDate')
        #         context= {'fromDate':fromDate,'toDate':toDate}
        #         hist_img_path = historys.objects.filter(user1_id=iduserck,hist_date__range=[fromDate,toDate]).order_by('-hist_date')
        #         p = Paginator(hist_img_path, 5) 
        #         page_num = request.GET.get('page',1)
        #         try:
        #             page = p.page(page_num)
        #         except EmptyPage:
        #             page = p.page(1)

                
        #         context = {'images':page,'dSLt':dSLt}
        #         return render(request,'history.html',context)
                        
                
            

        # else:
        #     hist_img_path = historys.objects.filter(user1_id=iduserck).order_by('-hist_date')
        

        # p = Paginator(hist_img_path, 5) 
        # page_num = request.GET.get('page',1)
        # try:
        #     page = p.page(page_num)
        # except EmptyPage:
        #     page = p.page(1)

        
        # context = {'images':page,'dSLt':dSLt}
        context = {'images':hist_img_path}
        return render(request,'history.html',context)
    else:
        return redirect('/login')

def orch(request):
    return render(request,'orch.html')
def orchdis(request):
    listorchdis = leaf_dis.objects.all()
   
    return render(request,'orchdis.html', {'listorchdis':listorchdis})
def hislist(request):
    return render(request,'hislist.html')
def testForm(request):
    return render(request,'testForm.html')
    

def randomString(stringLength=20):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))

def funcktypefile(typename):
    textran = randomString()
    if typename.endswith('.png'):
        typename = textran+'.png'
    elif typename.endswith('.gif'):
        typename = textran+'.gif'
    elif typename.endswith('.jpg'):
        typename = textran+'.jpg'
    elif typename.endswith('.jpeg'):
        typename = textran+'.jpeg'
    return typename
def insertForm(request):
    return render(request,'insert.html')

def insert(request):







    if request.session.get('username',False):
        user=User.objects.get(username=request.session['username'])
        if request.method == "POST":
            iduser = user.id
            timenow = timenows()
            insert = historys()
            if len(request.FILES) != 0:
                insert.hist_img_path = request.FILES['image']     
                typenamepic = insert.hist_img_path.name
                typenamepic = funcktypefile(typenamepic)
                fs = FileSystemStorage(location='media/uploads/')
                filename = fs.save(typenamepic, insert.hist_img_path)
                uploaded_file_url_frontpic = fs.url(filename)
                path_img = 'media/uploads/'+filename
                checks=request.POST.getlist('checks')

                
                #บันทึกลงประวัติ     
                if checks==['1']:
                                    #โมเดลใบกล้วยไม้หรือใบอื่นๆ
                    filepath='blogs/model_l3.h5'
                    filepath_model = 'blogs/model_l3.json'
                    filepath_weights = 'blogs/weights_model_l3.h5'
                    predict_model = load_model(filepath) 
                    with open(filepath_model, 'r') as f:
                        loaded_model_json = f.read()
                        predict_model = model_from_json(loaded_model_json)
                        predict_model.load_weights(filepath_weights)    
                        print("Loaded model from disk")    
                    test_path = (path_img)
                    img = keras.preprocessing.image.load_img(test_path, target_size=(224, 224))
                    img_array = keras.preprocessing.image.img_to_array(img)
                    img_array = tf.expand_dims(img_array, 0)
                    predictions = predict_model.predict(img_array)
                    scoreL = tf.nn.softmax(predictions[0])
                    print("orchid",scoreL[0],"other_leaf",scoreL[1])
               
               
                    

                    
                    #ใบกล้วยไม้-----------------------------------------------------------------------
                    if scoreL[0]==np.max(scoreL) :
                                        #โมเดลใบปกติหรือติดโรค
                        filepathabn='blogs/model_abn3.h5'
                        filepath_model_abn = 'blogs/model_abn3.json'
                        filepath_weights_abn = 'blogs/weights_model_abn3.h5'
                        predict_model_abn = load_model(filepathabn) 

                        with open(filepath_model_abn, 'r') as f:
                            loaded_model_json = f.read()
                            predict_model_abn = model_from_json(loaded_model_json)
                            predict_model_abn.load_weights(filepath_weights_abn)    
                            print("Loaded model from disk")
                        leaf = "เป็นใบกล้วยไม้"
                        img = keras.preprocessing.image.load_img(test_path, target_size=(224, 224))
                        img_array = keras.preprocessing.image.img_to_array(img)
                        img_array = tf.expand_dims(img_array, 0)
                        predictions = predict_model_abn.predict(img_array)
                        scoreA = tf.nn.softmax(predictions[0])
                        print("abnormal",scoreA[0],"normal",scoreA[1])
                        
                        #ใบปกติ************************************************************************
                        if scoreA[0]==np.max(scoreA) :
                                                    #โมเดลโรคใบกล้วยไม้
                            filepathd='blogs/model_d4.h5'
                            filepath_model_d = 'blogs/model_d4.json'
                            filepath_weights_d = 'blogs/weights_model_d4.h5'
                            predict_model_d = load_model(filepathd)  
                            with open(filepath_model_d, 'r') as f:
                                loaded_model_json = f.read()
                                predict_model_d = model_from_json(loaded_model_json)
                                predict_model_d.load_weights(filepath_weights_d)    
                                print("Loaded model from disk")

                            status = "เป็นใบที่ติดโรค"
                            
                            img = keras.preprocessing.image.load_img(test_path, target_size=(224, 224))
                            img_array = keras.preprocessing.image.img_to_array(img)
                            img_array = tf.expand_dims(img_array, 0)
                            predictions = predict_model_d.predict(img_array)
                            score = tf.nn.softmax(predictions[0])
                            print("black_rot",score[0], "rot",score[1],"yellow_leaf_spot",score[2])
                            
                            #ใบเป็นโรค////////////////////////////////////////////////////////////////////
                            if score[0]==np.max(score) :
                                disease = "โรคเน่าดำ"
                                d=1
                            elif score[1]==np.max(score) :
                                disease = "โรคเน่า"
                                d=2
                            elif score[2]==np.max(score) :
                                disease = "โรคใบปื้นเหลือง"
                                d=3
                            score_disease = 100 * np.max(score)
                            output = float("%0.2f"%score_disease)
                            leaf=''
                            status=''
                            print("มีความมั่นใจว่าจะเป็น {} {:.2f}%.".format(disease, 100 * np.max(score)))
                            context = {
                                    'disease':disease,
                                    'leaf':leaf,
                                    'status':status,
                                    'score':output,
                                    'img':path_img,
                                    'times':timenow,
                                    }
                            insert = historys(
                                    user1_id=iduser,
                                    pub_date=timenow,
                                    hist_img_path=request.FILES['image'] ,
                                    scoreDisease=score_disease,
                                    leafType=leaf,
                                    statusLeaf=status,
                                    diseaseOc=disease,
                                )
                            insert.save()     
                            messages.success(request, 'ตรวจสอบเสร็จสิ้น !')                       
                            return render(request,'insert.html',context)                                 
                        elif scoreA[1]==np.max(scoreA) :
                            status = "เป็นใบปกติ"
                            disease=''
                            leaf=''
                            score_A = 100 * np.max(scoreA)
                            outputA = float("%0.2f"%score_A)
                            print("มีความมั่นใจว่าจะเป็น {} {:.2f}%.".format(status, 100 * np.max(scoreA)))
                            context = {
                            'leaf':leaf,
                            'status':status,
                            'score':outputA,
                            'img':path_img,
                            'times':timenow,
                            
                            }
                            insert = historys(
                                        user1_id=iduser,
                                        pub_date=timenow,
                                        hist_img_path=request.FILES['image'] ,
                                        scoreisease=score_A,
                                        leafType=leaf,
                                        statusLeaf=status,
                                        diseaseOc=disease,
                                    )
                            insert.save()
                            messages.success(request, 'ตรวจสอบเสร็จสิ้น !')
                            return render(request,'insert.html',context)
                    elif scoreL[1]==np.max(scoreL) :
                        leaf = "ไม่ใช่ใบกล้วยไม้"
                        disease=''
                        status=''
                        score_l = 100 * np.max(scoreL)
                        outputl = float("%0.2f"%score_l)
                        print("มีความมั่นใจว่าจะเป็น {} {:.2f}%.".format(leaf, 100 * np.max(scoreL)))
                        context = {
                            'leaf':leaf,
                            'score':outputl,
                            'img':path_img,
                            'times':timenow,
                            }
                        insert = historys(
                                    user1_id=iduser,
                                    pub_date=timenow,
                                    hist_img_path=request.FILES['image'] ,
                                    scoreisease=score_l,
                                    leafType=leaf,
                                    statusLeaf=status,
                                    diseaseOc=disease,
                                )
                        insert.save()
                        messages.success(request, 'ตรวจสอบเสร็จสิ้น !')
                        return render(request,'insert.html',context)
                    # elif scoreL[0]==np.max(scoreL) :
                    #     leaf = "ไม่ใช่ใบไม้"
                    #     disease=''
                    #     status=''
                    #     score_l = 100 * np.max(scoreL)
                    #     outputl = float("%0.2f"%score_l)
                    #     print("มีความมั่นใจว่าจะเป็น {} {:.2f}%.".format(leaf, 100 * np.max(scoreL)))
                    #     context = {
                    #         'leaf':leaf,
                    #         'score':outputl,
                    #         'img':path_img,
                    #         'times':timenow,
                    #         }
                    #     insert = historys(
                    #                 user1_id=iduser,
                    #                 pub_date=timenow,
                    #                 hist_img_path=request.FILES['image'] ,
                    #                 scoreisease=score_l,
                    #                 leafType=leaf,
                    #                 statusLeaf=status,
                    #                 diseaseOc=disease,
                    #             )
                    #     insert.save()
                    #     messages.success(request, 'ตรวจสอบเสร็จสิ้น !')
                    #     return render(request,'insert.html',context)

                    #ไม่บันทึกลงประวัติ
                else:
                                      #โมเดลใบกล้วยไม้หรือใบอื่นๆ
                    filepath='blogs/model_l7.h5'
                    filepath_model = 'blogs/model_l7.json'
                    filepath_weights = 'blogs/weights_model_l7.h5'
                    predict_model = load_model(filepath) 
                    with open(filepath_model, 'r') as f:
                        loaded_model_json = f.read()
                        predict_model = model_from_json(loaded_model_json)
                        predict_model.load_weights(filepath_weights)    
                        print("Loaded model from disk")    
                    test_path = (path_img)
                    img = keras.preprocessing.image.load_img(test_path, target_size=(224, 224))
                    img_array = keras.preprocessing.image.img_to_array(img)
                    img_array = tf.expand_dims(img_array, 0)
                    predictions = predict_model.predict(img_array)
                    scoreL = tf.nn.softmax(predictions[0])
                    print("orchid",scoreL[0],"other_leaf",scoreL[1])
                

                    if scoreL[0]==np.max(scoreL) :
                                          #โมเดลใบปกติหรือติดโรค
                        filepathabn='blogs/model_abn4.h5'
                        filepath_model_abn = 'blogs/model_abn4.json'
                        filepath_weights_abn = 'blogs/weights_model_abn4.h5'
                        predict_model_abn = load_model(filepathabn) 

                        with open(filepath_model_abn, 'r') as f:
                            loaded_model_json = f.read()
                            predict_model_abn = model_from_json(loaded_model_json)
                            predict_model_abn.load_weights(filepath_weights_abn)    
                            print("Loaded model from disk")
                        leaf = "เป็นใบกล้วยไม้"
                        l=1
                        img = keras.preprocessing.image.load_img(test_path, target_size=(224, 224))
                        img_array = keras.preprocessing.image.img_to_array(img)
                        img_array = tf.expand_dims(img_array, 0)
                        predictions = predict_model_abn.predict(img_array)
                        scoreA = tf.nn.softmax(predictions[0])
                        print("abnormal",scoreA[0],"normal",scoreA[1])
                  
                        if scoreA[0]==np.max(scoreA) :
                                                                                #โมเดลโรคใบกล้วยไม้
                            filepathd='blogs/model_d5.h5'
                            filepath_model_d = 'blogs/model_d5.json'
                            filepath_weights_d = 'blogs/weights_model_d5.h5'
                            predict_model_d = load_model(filepathd)  
                            with open(filepath_model_d, 'r') as f:
                                loaded_model_json = f.read()
                                predict_model_d = model_from_json(loaded_model_json)
                                predict_model_d.load_weights(filepath_weights_d)    
                                print("Loaded model from disk")

                            status = "เป็นใบที่ติดโรค"
                            img = keras.preprocessing.image.load_img(test_path, target_size=(224, 224))
                            img_array = keras.preprocessing.image.img_to_array(img)
                            img_array = tf.expand_dims(img_array, 0)
                            predictions = predict_model_d.predict(img_array)
                            score = tf.nn.softmax(predictions[0])
                            print("not_leaf",score[0],"orchid",score[1],"other_leaf",score[2])
                            

                            if score[0]==np.max(score) :
                                disease = "โรคเน่าดำ"
                                d=1
                            elif score[1]==np.max(score) :
                                disease = "โรคเน่า"
                                d=2
                            elif score[2]==np.max(score) :
                                disease = "โรคใบปื้นเหลือง"
                                d=3
                            score_disease = 100 * np.max(score)
                            output = float("%0.2f"%score_disease)
                            diseaseID=d
                            print("มีความมั่นใจว่าจะเป็น {} {:.2f}%.".format(disease, 100 * np.max(score)))
                            context = {
                                    'disease':disease,
                                    'leaf':leaf,
                                    'status':status,
                                    'score':output,
                                    'img':path_img,
                                    'times':timenow,
                                    }     
                            messages.success(request, 'ตรวจสอบเสร็จสิ้น !')                               
                            return render(request,'insert.html',context)
                        elif scoreA[1]==np.max(scoreA) :
                            status = "เป็นใบปกติ"
                        score_A = 100 * np.max(scoreA)
                        outputA = float("%0.2f"%score_A)
                        print("มีความมั่นใจว่าจะเป็น {} {:.2f}%.".format(status, 100 * np.max(scoreA)))
                        context = {
                        'leaf':leaf,
                        'status':status,
                        'score':outputA,
                        'img':path_img,
                        'times':timenow,
                        
                        }
                        messages.success(request, 'ตรวจสอบเสร็จสิ้น !')
                        return render(request,'insert.html',context)

                    elif scoreL[1]==np.max(scoreL) :
                        leaf = "ไม่ใช่ใบกล้วยไม้"
                        scorel = 100 * np.max(scoreL)
                        outputl = float("%0.2f"%scorel)

                    
                    context = {
                        'leaf':leaf,
                        'score':outputl,
                        'img':path_img,
                        'times':timenow,
                        }
                    messages.success(request, 'ตรวจสอบเสร็จสิ้น !')
                    return render(request,'insert.html',context)
        
        images = historys.objects.all()  
        context = {'images':images,}
    else: 
            return redirect('/login')
    return render(request,'insert.html',context)


def delete(request,pk):
    insert = historys.objects.filter(hist_id=pk)
    insert.delete()
    return redirect('/insert')

def addUser(request):
    username=request.POST['username']
    first_name=request.POST['FirstName']
    last_name=request.POST['LastName']
    password=request.POST['password']
    repassword=request.POST["repassword"]
    email=request.POST["email"]

    if password==repassword:
        if User.objects.filter(username=username).exists():
            messages.info(request,'มีชื่อผู้ใช้นี้แล้ว')
            return redirect('/register')
        else : 
            user=User.objects.create_user(
        username=username,
        password=password,
        first_name=first_name,
        last_name=last_name,
        email=email,
         )
        user.save()
        return redirect('/login')
    else :
        messages.info(request,'รหัสผ่านไม่ตรงกัน')
        return redirect('/register')
        
def login(request):
    username=request.POST['username']
    password=request.POST['password']

    #loginCheck,login,password
    user=auth.authenticate(username=username,password=password)
    
    if user is not None :
        auth.login(request,user)
        request.session['username'] = user.username
        return redirect('/insertForm')
    else :
        messages.info(request,'Username Or Password is incorrect')
        return redirect('/login')
def logout(request):
    del request.session['username']
    auth.logout(request)
    
    return redirect('/index')


def update_orchdis(request):
    listorchdis = leaf_dis.objects.all()
    context = {'listorchdis':listorchdis}

    return render(request,'update_orchdis.html', context)

def add_orchdis(request):
    if request.method =="POST":
        addorchdis = leaf_dis()
        addorchdis.disease_name = request.POST.get('name')
        addorchdis.disease_look = request.POST.get('look')
        addorchdis.disease_epidemic = request.POST.get('epidemic')
        addorchdis.disease_prevent = request.POST.get('prevent')

        if len(request.FILES) !=0:
            addorchdis.disease_image = request.FILES['disease_image']

        addorchdis.save()
        return redirect('/add_orchdis')
    return render(request,'add_orchdis.html')

def deleteOrchdis(request,pk):
    orchdis = leaf_dis.objects.filter(disease_id=pk)
    orchdis.delete()
    
    return redirect('/update_orchdis')   

def edit_orchdis(request, pk):
    addorchdis = leaf_dis.objects.get(disease_id=pk)

    if request.method=="POST":
        if len(request.FILES) !=0:
            if len(addorchdis.disease_image) >0:
                os.remove(addorchdis.disease_image.path)
            addorchdis.disease_image = request.FILES['disease_image']
        addorchdis.disease_name = request.POST.get('name')
        addorchdis.disease_look = request.POST.get('look')
        addorchdis.disease_epidemic = request.POST.get('epidemic')
        addorchdis.disease_prevent = request.POST.get('prevent')
        addorchdis.save()
        return redirect('/update_orchdis')

    return render(request,'edit_orchdis.html',{'addorchdis':addorchdis})
def admin_user_history(request, pk):
    if request.session.get('username',False):
           
            his = historys.objects.filter(user1_id=pk)
            # pk=pk
            # p = Paginator(his, 5)
            # page_num = request.GET.get('page',1)
            # try:
            #     page = p.page(page_num)
            # except EmptyPage:
            #     page = p.page(1)

            context = {'images':his}
            return render(request,'admin_user_history.html',context)
    else:
        return redirect('/login')
def admin_user_detail(request):
    UserDT = User.objects.all()
    
    p = Paginator(UserDT, 5)
    page_num = request.GET.get('page',1)
    try:
        page = p.page(page_num)
    except EmptyPage:
        page = p.page(1)

        
    user_count = User.objects.all().count()
    user_count = int(user_count)
    
    context = {'UserDT':UserDT,'images':page,'user_count':user_count}

    return render(request,'admin_user_details.html',context)  
def overviews(request):
        
    user= User.objects.get(username=request.session['username'])
    iduserck = user.id
    

    now = datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
    nowY = now.year
    if request.GET.get('timeS'):
        year = request.GET.get('timeS')
        nowY = year
    else:
        now = datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
        nowY = now.year





    #############################    เดือน 1    ###################################
    rot1 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=1,hist_date__year=nowY).count()
    rot1 = int(rot1)
    print('Number of rot1 : ',rot1)

    black_rot1 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=1,hist_date__year=nowY).count()
    black_rot1 = int(black_rot1)
    print('Number of black_rot1 : ',black_rot1)

    yellow_leaf1 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=1,hist_date__year=nowY).count()
    yellow_leaf1 = int(yellow_leaf1)
    print('Number of yellow_leaf_spot1 : ',yellow_leaf1)

     #############################    เดือน 2   ###################################
    rot2 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=2,hist_date__year=nowY).count()
    rot2 = int(rot2)
    print('Number of rot2 : ',rot2)

    black_rot2 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=2,hist_date__year=nowY).count()
    black_rot2 = int(black_rot2)
    print('Number of black_rot : ',black_rot2)

    yellow_leaf2 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=2,hist_date__year=nowY).count()
    yellow_leaf2 = int(yellow_leaf2)
    print('Number of yellow_leaf_spot : ',yellow_leaf2)


     #############################    เดือน 3    ###################################
    rot3 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=3,hist_date__year=nowY).count()
    rot3 = int(rot3)
    print('Number of rot3 : ',rot3)

    black_rot3 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=3,hist_date__year=nowY).count()
    black_rot3 = int(black_rot3)
    print('Number of black_rot3 : ',black_rot3)

    yellow_leaf3 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=3,hist_date__year=nowY).count()
    yellow_leaf3 = int(yellow_leaf3)
    print('Number of yellow_leaf_spot3 : ',yellow_leaf3)


    #############################    เดือน 4    ###################################
    rot4 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=4,hist_date__year=nowY).count()
    rot4 = int(rot4)
    print('Number of rot4 : ',rot4)

    black_rot4 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=4,hist_date__year=nowY).count()
    black_rot4 = int(black_rot4)
    print('Number of black_rot4 : ',black_rot4)

    yellow_leaf4 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=4,hist_date__year=nowY).count()
    yellow_leaf4 = int(yellow_leaf4)
    print('Number of yellow_leaf_spot : ',yellow_leaf4)



     #############################    เดือน 5    ###################################
    rot5 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=5,hist_date__year=nowY).count()
    rot5 = int(rot5)
    print('Number of rot : ',rot5)

    black_rot5 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=5,hist_date__year=nowY).count()
    black_rot5 = int(black_rot5)
    print('Number of black_rot5 : ',black_rot5)

    yellow_leaf5 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=5,hist_date__year=nowY).count()
    yellow_leaf5 = int(yellow_leaf5)
    print('Number of yellow_leaf_spot5 : ',yellow_leaf5)



     #############################    เดือน 6    ###################################
    rot6 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=6,hist_date__year=nowY).count()
    rot6 = int(rot6)
    print('Number of rot6 : ',rot6)

    black_rot6 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=6,hist_date__year=nowY).count()
    black_rot6 = int(black_rot6)
    print('Number of black_rot6 : ',black_rot6)

    yellow_leaf6 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=6,hist_date__year=nowY).count()
    yellow_leaf6 = int(yellow_leaf6)
    print('Number of yellow_leaf_spot6 : ',yellow_leaf6)



     #############################    เดือน 7    ###################################
    rot7 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=7,hist_date__year=nowY).count()
    rot7 = int(rot7)
    print('Number of rot7 : ',rot7)

    black_rot7 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=7,hist_date__year=nowY).count()
    black_rot7 = int(black_rot7)
    print('Number of black_rot7 : ',black_rot7)

    yellow_leaf7 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=7,hist_date__year=nowY).count()
    yellow_leaf7 = int(yellow_leaf7)
    print('Number of yellow_leaf_spot7 : ',yellow_leaf7)


     #############################    เดือน 8    ###################################

    rot8 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=8,hist_date__year=nowY).count()
    rot8 = int(rot8)
    print('Number of rot : ',rot8)

    black_rot8 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=8,hist_date__year=nowY).count()
    black_rot8 = int(black_rot8)
    print('Number of black_rot : ',black_rot8)

    yellow_leaf8 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=8,hist_date__year=nowY).count()
    yellow_leaf8 = int(yellow_leaf8)
    print('Number of yellow_leaf_spot8 : ',yellow_leaf8)


     #############################    เดือน 9    ###################################

    rot9 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=9,hist_date__year=nowY).count()
    rot9 = int(rot9)
    print('Number of rot9 : ',rot9)

    black_rot9 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=9,hist_date__year=nowY).count()
    black_rot9 = int(black_rot9)
    print('Number of black_rot9 : ',black_rot9)

    yellow_leaf9 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=9,hist_date__year=nowY).count()
    yellow_leaf9 = int(yellow_leaf9)
    print('Number of yellow_leaf_spot9 : ',yellow_leaf9)


     #############################    เดือน 10    ###################################
    rot10 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=10,hist_date__year=nowY).count()
    rot10 = int(rot10)
    print('Number of rot10 : ',rot10)

    black_rot10 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=10,hist_date__year=nowY).count()
    black_rot10 = int(black_rot10)
    print('Number of black_rot10 : ',black_rot10)

    yellow_leaf10 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=10,hist_date__year=nowY).count()
    yellow_leaf10 = int(yellow_leaf10)
    print('Number of yellow_leaf_spot10 : ',yellow_leaf10)


     #############################    เดือน 11    ###################################
    rot11 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=11,hist_date__year=nowY).count()
    rot11 = int(rot11)
    print('Number of rot11 : ',rot11)

    black_rot11 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=11,hist_date__year=nowY).count()
    black_rot11 = int(black_rot11)
    print('Number of black_rot11 : ',black_rot11)

    yellow_leaf11 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=11,hist_date__year=nowY).count()
    yellow_leaf11 = int(yellow_leaf11)
    print('Number of yellow_leaf_spot11 : ',yellow_leaf11)




    #############################    เดือน 12    ###################################

    rot12 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__month=12,hist_date__year=nowY).count()
    rot12 = int(rot12)
    print('Number of rot : ',rot12)

    black_rot12 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__month=12,hist_date__year=nowY).count()
    black_rot12 = int(black_rot12)
    print('Number of black_rot12 : ',black_rot12)

    yellow_leaf12 = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__month=12,hist_date__year=nowY).count()
    yellow_leaf12 = int(yellow_leaf12)
    print('Number of yellow_leaf_spot12 : ',yellow_leaf12)

    rot = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่า',hist_date__year=nowY).count()
    rot = int(rot)
    print('Number of rot : ',rot)

    black_rot = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคเน่าดำ',hist_date__year=nowY).count()
    black_rot = int(black_rot)
    print('Number of black_rot : ',black_rot)

    yellow_leaf = historys.objects.filter(user1_id=iduserck,diseaseOc='โรคใบปื้นเหลือง',hist_date__year=nowY).count()
    yellow_leaf = int(yellow_leaf)
    print('Number of yellow_leaf_spot : ',yellow_leaf)

    totalDisease = rot+black_rot+yellow_leaf
   
    mostDisease = max(rot, black_rot, yellow_leaf)
       
    lessDisease = min(rot, black_rot, yellow_leaf)
    
    if mostDisease != (''):
        if rot>black_rot and rot>yellow_leaf:
            mostDiseaseName='โรคเน่า'
            print(mostDiseaseName)
        elif black_rot>rot and black_rot>yellow_leaf:
            mostDiseaseName='โรคเน่าดำ'
            print(mostDiseaseName)
        elif yellow_leaf>rot and yellow_leaf>black_rot:
            mostDiseaseName='โรคใบปื้นเหลือง'
            print(mostDiseaseName)
        elif yellow_leaf == rot or rot == yellow_leaf:
            mostDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่า'

        elif yellow_leaf == black_rot or black_rot == yellow_leaf:
            mostDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่าดำ'
        elif black_rot == rot or rot == black_rot:
            mostDiseaseName= 'โรคเน่าดำกับโรคเน่า'
    if lessDisease !=(''):
        if rot<black_rot and rot<yellow_leaf:
            lessDiseaseName='โรคเน่า'
  
        elif black_rot<rot and black_rot<yellow_leaf:
            lessDiseaseName='โรคเน่าดำ'

        elif yellow_leaf<rot and yellow_leaf<black_rot:
            lessDiseaseName='โรคใบปื้นเหลือง'
     
        elif yellow_leaf == rot or rot == yellow_leaf:
            lessDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่า'

        elif yellow_leaf == black_rot or black_rot == yellow_leaf:
            lessDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่าดำ'
        elif black_rot == rot or rot == black_rot:
            lessDiseaseName= 'โรคเน่าดำกับโรคเน่า'

    currentYear= datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
    currentYear=currentYear.year


   
    disOrch_list = ['โรคเน่า','โรคเน่าดำ','โรคใบปื้นเหลือง']
    number_list  = [rot1, black_rot1, yellow_leaf1]

    number_rot = [rot1,rot2,rot3,rot4,rot5,rot6,rot7,rot8,rot9,rot10,rot11,rot12]
    number_black_rot = [black_rot1,black_rot2,black_rot3,black_rot4,black_rot5,black_rot6,black_rot7,black_rot8,black_rot9,black_rot10,black_rot11,black_rot12]
    number_yellow_leaf = [yellow_leaf1,yellow_leaf2,yellow_leaf3,yellow_leaf4,yellow_leaf5,yellow_leaf6,yellow_leaf7,yellow_leaf8,yellow_leaf9,yellow_leaf10,yellow_leaf11,yellow_leaf12]

    


    month_list = ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']
    context = {'disOrch_list':disOrch_list,'number_list':number_list,'month_list':month_list,
    'number_rot':number_rot,'number_black_rot':number_black_rot,
    'number_yellow_leaf':number_yellow_leaf,'nowY':nowY,'currentYear':currentYear,
    'total':totalDisease,'most':mostDisease,'less':lessDisease,'mostName':mostDiseaseName,'lessName':lessDiseaseName,'rot':rot,'black_rot':black_rot,'yellow_leaf':yellow_leaf
    }

    return render(request,'overviews.html',context)
   


##################################################################################################################################
def overviews_admin(request, year=datetime.datetime.now().year, month=datetime.datetime.now().strftime('%B')):

    user= User.objects.get(username=request.session['username'])
    iduserck = user.id
    now = datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
    nowY = now.year
    if request.GET.get('timeS'):
        year = request.GET.get('timeS')
        nowY = year
    else:
        now = datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
        nowY = now.year


    #############################    เดือน 1    ###################################
    rot1 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=1,hist_date__year=nowY).count()
    rot1 = int(rot1)
    print('Number of rot1 : ',rot1)

    black_rot1 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=1,hist_date__year=nowY).count()
    black_rot1 = int(black_rot1)
    print('Number of black_rot1 : ',black_rot1)

    yellow_leaf1 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=1,hist_date__year=nowY).count()
    yellow_leaf1 = int(yellow_leaf1)
    print('Number of yellow_leaf_spot1 : ',yellow_leaf1)

     #############################    เดือน 2   ###################################
    rot2 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=2,hist_date__year=nowY).count()
    rot2 = int(rot2)
    print('Number of rot2 : ',rot2)

    black_rot2 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=2,hist_date__year=nowY).count()
    black_rot2 = int(black_rot2)
    print('Number of black_rot : ',black_rot2)

    yellow_leaf2 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=2,hist_date__year=nowY).count()
    yellow_leaf2 = int(yellow_leaf2)
    print('Number of yellow_leaf_spot : ',yellow_leaf2)


     #############################    เดือน 3    ###################################
    rot3 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=3,hist_date__year=nowY).count()
    rot3 = int(rot3)
    print('Number of rot3 : ',rot3)

    black_rot3 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=3,hist_date__year=nowY).count()
    black_rot3 = int(black_rot3)
    print('Number of black_rot3 : ',black_rot3)

    yellow_leaf3 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=3,hist_date__year=nowY).count()
    yellow_leaf3 = int(yellow_leaf3)
    print('Number of yellow_leaf_spot3 : ',yellow_leaf3)


    #############################    เดือน 4    ###################################
    rot4 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=4,hist_date__year=nowY).count()
    rot4 = int(rot4)
    print('Number of rot4 : ',rot4)

    black_rot4 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=4,hist_date__year=nowY).count()
    black_rot4 = int(black_rot4)
    print('Number of black_rot4 : ',black_rot4)

    yellow_leaf4 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=4,hist_date__year=nowY).count()
    yellow_leaf4 = int(yellow_leaf4)
    print('Number of yellow_leaf_spot : ',yellow_leaf4)



     #############################    เดือน 5    ###################################
    rot5 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=5,hist_date__year=nowY).count()
    rot5 = int(rot5)
    print('Number of rot : ',rot5)

    black_rot5 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=5,hist_date__year=nowY).count()
    black_rot5 = int(black_rot5)
    print('Number of black_rot5 : ',black_rot5)

    yellow_leaf5 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=5,hist_date__year=nowY).count()
    yellow_leaf5 = int(yellow_leaf5)
    print('Number of yellow_leaf_spot5 : ',yellow_leaf5)



     #############################    เดือน 6    ###################################
    rot6 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=6,hist_date__year=nowY).count()
    rot6 = int(rot6)
    print('Number of rot6 : ',rot6)

    black_rot6 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=6,hist_date__year=nowY).count()
    black_rot6 = int(black_rot6)
    print('Number of black_rot6 : ',black_rot6)

    yellow_leaf6 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=6,hist_date__year=nowY).count()
    yellow_leaf6 = int(yellow_leaf6)
    print('Number of yellow_leaf_spot6 : ',yellow_leaf6)



     #############################    เดือน 7    ###################################
    rot7 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=7,hist_date__year=nowY).count()
    rot7 = int(rot7)
    print('Number of rot7 : ',rot7)

    black_rot7 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=7,hist_date__year=nowY).count()
    black_rot7 = int(black_rot7)
    print('Number of black_rot7 : ',black_rot7)

    yellow_leaf7 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=7,hist_date__year=nowY).count()
    yellow_leaf7 = int(yellow_leaf7)
    print('Number of yellow_leaf_spot7 : ',yellow_leaf7)


     #############################    เดือน 8    ###################################

    rot8 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=8,hist_date__year=nowY).count()
    rot8 = int(rot8)
    print('Number of rot : ',rot8)

    black_rot8 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=8,hist_date__year=nowY).count()
    black_rot8 = int(black_rot8)
    print('Number of black_rot : ',black_rot8)

    yellow_leaf8 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=8,hist_date__year=nowY).count()
    yellow_leaf8 = int(yellow_leaf8)
    print('Number of yellow_leaf_spot8 : ',yellow_leaf8)


     #############################    เดือน 9    ###################################

    rot9 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=9,hist_date__year=nowY).count()
    rot9 = int(rot9)
    print('Number of rot9 : ',rot9)

    black_rot9 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=9,hist_date__year=nowY).count()
    black_rot9 = int(black_rot9)
    print('Number of black_rot9 : ',black_rot9)

    yellow_leaf9 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=9,hist_date__year=nowY).count()
    yellow_leaf9 = int(yellow_leaf9)
    print('Number of yellow_leaf_spot9 : ',yellow_leaf9)


     #############################    เดือน 10    ###################################
    rot10 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=10,hist_date__year=nowY).count()
    rot10 = int(rot10)
    print('Number of rot10 : ',rot10)

    black_rot10 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=10,hist_date__year=nowY).count()
    black_rot10 = int(black_rot10)
    print('Number of black_rot10 : ',black_rot10)

    yellow_leaf10 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=10,hist_date__year=nowY).count()
    yellow_leaf10 = int(yellow_leaf10)
    print('Number of yellow_leaf_spot10 : ',yellow_leaf10)


     #############################    เดือน 11    ###################################
    rot11 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=11,hist_date__year=nowY).count()
    rot11 = int(rot11)
    print('Number of rot11 : ',rot11)

    black_rot11 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=11,hist_date__year=nowY).count()
    black_rot11 = int(black_rot11)
    print('Number of black_rot11 : ',black_rot11)

    yellow_leaf11 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=11,hist_date__year=nowY).count()
    yellow_leaf11 = int(yellow_leaf11)
    print('Number of yellow_leaf_spot11 : ',yellow_leaf11)




    #############################    เดือน 12    ###################################

    rot12 = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__month=12,hist_date__year=nowY).count()
    rot12 = int(rot12)
    print('Number of rot : ',rot12)

    black_rot12 = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__month=12,hist_date__year=nowY).count()
    black_rot12 = int(black_rot12)
    print('Number of black_rot12 : ',black_rot12)

    yellow_leaf12 = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__month=12,hist_date__year=nowY).count()
    yellow_leaf12 = int(yellow_leaf12)
    print('Number of yellow_leaf_spot12 : ',yellow_leaf12)
    rot = historys.objects.filter(diseaseOc='โรคเน่า',hist_date__year=nowY).count()
    rot = int(rot)
    print('Number of rot : ',rot)

    black_rot = historys.objects.filter(diseaseOc='โรคเน่าดำ',hist_date__year=nowY).count()
    black_rot = int(black_rot)
    print('Number of black_rot : ',black_rot)

    yellow_leaf = historys.objects.filter(diseaseOc='โรคใบปื้นเหลือง',hist_date__year=nowY).count()
    yellow_leaf = int(yellow_leaf)
    print('Number of yellow_leaf_spot : ',yellow_leaf)

    total_user = User.objects.all().count()
    total_user = int(total_user)

    disOrch_list = ['โรคเน่า','โรคเน่าดำ','โรคใบปื้นเหลือง']
    number_list  = [rot, black_rot, yellow_leaf]
    

    totalDisease = rot+black_rot+yellow_leaf
   
    mostDisease = max(rot, black_rot, yellow_leaf)
       
    lessDisease = min(rot, black_rot, yellow_leaf)
    
    if mostDisease != (''):
        if rot>black_rot and rot>yellow_leaf:
            mostDiseaseName='โรคเน่า'
            print(mostDiseaseName)
        elif black_rot>rot and black_rot>yellow_leaf:
            mostDiseaseName='โรคเน่าดำ'
            print(mostDiseaseName)
        elif yellow_leaf>rot and yellow_leaf>black_rot:
            mostDiseaseName='โรคใบปื้นเหลือง'
            print(mostDiseaseName)
        elif yellow_leaf == rot or rot == yellow_leaf:
            mostDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่า'

        elif yellow_leaf == black_rot or black_rot == yellow_leaf:
            mostDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่าดำ'
        elif black_rot == rot or rot == black_rot:
            mostDiseaseName= 'โรคเน่าดำกับโรคเน่า'
    if lessDisease !=(''):
        if rot<black_rot and rot<yellow_leaf:
            lessDiseaseName='โรคเน่า'
  
        elif black_rot<rot and black_rot<yellow_leaf:
            lessDiseaseName='โรคเน่าดำ'

        elif yellow_leaf<rot and yellow_leaf<black_rot:
            lessDiseaseName='โรคใบปื้นเหลือง'
     
        elif yellow_leaf == rot or rot == yellow_leaf:
            lessDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่า'

        elif yellow_leaf == black_rot or black_rot == yellow_leaf:
            lessDiseaseName= 'โรคใบปื้นเหลืองเท่ากับโรคเน่าดำ'
        elif black_rot == rot or rot == black_rot:
            lessDiseaseName= 'โรคเน่าดำกับโรคเน่า'
    currentYear= datetime.datetime.now(pytz.timezone('Asia/Bangkok'))
    currentYear=currentYear.year
    
    number_rot = [rot1,rot2,rot3,rot4,rot5,rot6,rot7,rot8,rot9,rot10,rot11,rot12]
    number_black_rot = [black_rot1,black_rot2,black_rot3,black_rot4,black_rot5,black_rot6,black_rot7,black_rot8,black_rot9,black_rot10,black_rot11,black_rot12]
    number_yellow_leaf = [yellow_leaf1,yellow_leaf2,yellow_leaf3,yellow_leaf4,yellow_leaf5,yellow_leaf6,yellow_leaf7,yellow_leaf8,yellow_leaf9,yellow_leaf10,yellow_leaf11,yellow_leaf12]


        

    month_list = ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']
    context = {
        
        'disOrch_list':disOrch_list,'number_list':number_list,'month_list':month_list,'rot':rot,'black_rot':black_rot,'yellow_leaf':yellow_leaf,
        'nowY':nowY,'currentYear':currentYear,
        'total':totalDisease,'most':mostDisease,'less':lessDisease,'mostName':mostDiseaseName,'lessName':lessDiseaseName,
        'totalUser':total_user, 'number_rot':number_rot,'number_black_rot':number_black_rot,
    'number_yellow_leaf':number_yellow_leaf,
        
        }



    return render(request,'overviews_admin.html',context)

def result(request):
    
    return render(request,'result.html')
def data_table(request):
    return render(request,'data_table.html')