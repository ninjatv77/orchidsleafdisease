from django.contrib import admin
from .models import leaf_images
from .models import leaf_dis
from .models import historys
# Register your models here.

admin.site.register(leaf_images)
admin.site.register(leaf_dis)
admin.site.register(historys)
