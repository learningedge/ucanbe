'''
Created on Jan 28, 2012

@author: Mike_Edwards
'''
from django.forms.forms import Form
from django.forms.fields import CharField
from django.forms.widgets import Textarea

class AssociationTagBulkForm(Form):
    """Creates a form for add tag in bulk."""
    bulk_tags = CharField(label="Tags", widget=Textarea({'cols':60, 'rows':20}))