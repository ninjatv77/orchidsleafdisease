from dataclasses import field, fields
import django_filters

from .models import *

class hisFilter(django_filters.FilterSet):
    class Meta:
        model = leaf_images
        fields = ['img_date']