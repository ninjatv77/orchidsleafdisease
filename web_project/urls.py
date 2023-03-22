"""web_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from blogs import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home),
    path('index',views.home,name="index"),
    path('login',views.loginForm,name="loginForm"),
    path('orch',views.orch),
    path('orchdis',views.orchdis),
    path('register',views.register),
    path('history',views.history,name='history'),
    path('hislist',views.hislist),    
    path('addForm',views.addUser),
    path('loginForm',views.login),
    path('logout',views.logout),
    path('insert',views.insert),
    path('update_orchdis',views.update_orchdis,name="update_orchdis"),
    path('add_orchdis',views.add_orchdis,name="add_orchdis"),
    path('edit_orchdis/<str:pk>',views.edit_orchdis,name="edit_orchdis"),
    path('delete/<str:pk>',views.delete,name="delete"),
    path('deleteOrchdis/<str:pk>',views.deleteOrchdis,name="deleteOrchdis"),
    path('admin_user_details',views.admin_user_detail,name="admin_user_details"),
    path('admin_user_history/<str:pk>/',views.admin_user_history,name="admin_user_history"),
    path('insertForm',views.insertForm,name="insertForm"),
    path('overviews',views.overviews,name='overviews'),
    path('overviews_admin',views.overviews_admin,name='overviews_admin'),
    path('result',views.result),
    path('data_table',views.data_table),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)