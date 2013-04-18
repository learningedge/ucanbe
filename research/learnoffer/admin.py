'''
Created on Jan 22, 2012

@author: Mike_Edwards
'''
from django.contrib import admin
from research.learnoffer.models import LearnerStory, OfferingStory,\
    AssociationTag, Association, LearnerWorkerTest,\
    LearnerWorkerTestOfferingPair, StoryTemplate
from mptt.admin import MPTTModelAdmin
from django.contrib.admin import ModelAdmin 
from django.contrib.contenttypes.generic import GenericTabularInline
from mptt.forms import MPTTAdminForm

class AssociationInline(GenericTabularInline):
    form = MPTTAdminForm
    model = Association
    extra = 1

class OfferingStoryAdmin(ModelAdmin):
    inlines = [
               AssociationInline,
               ]

admin.site.register(LearnerStory,MPTTModelAdmin)
admin.site.register(OfferingStory,OfferingStoryAdmin)
admin.site.register(AssociationTag,MPTTModelAdmin)
admin.site.register(Association,MPTTModelAdmin)
admin.site.register(LearnerWorkerTest,MPTTModelAdmin)
admin.site.register(LearnerWorkerTestOfferingPair,MPTTModelAdmin)
admin.site.register(StoryTemplate,MPTTModelAdmin)
