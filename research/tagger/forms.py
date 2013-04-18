from django.forms import *
from django.forms.formsets import formset_factory

class AmazonCachedItemForm(Form):
    asin = CharField()
    
class AmazonCachedItemDeleteForm(Form):
    asin = CharField(widget=HiddenInput)
    delete = BooleanField(widget=HiddenInput, required=False)
    
AmazonCachedItemDeleteFormset = formset_factory(AmazonCachedItemDeleteForm)
    
class AmazonCachedItemSearchForm(Form):
    term = CharField()
    search_index = ChoiceField(widget=Select, choices=(
        ("Toys", "Toys"),
        ("Books", "Books")))
    min_age = IntegerField(label="Minimum age in years")
    max_age = IntegerField(label="Maximum age in years")
    
class TaggingForm(Form):
    source_id = CharField(widget=HiddenInput, required=False)
    supplier = CharField(widget=HiddenInput, required=False)
    affinity_tags = CharField(required=False)
    affinity_delete = CharField(widget=HiddenInput, required=False)
    requirement_tag_display = CharField(required=False)
    requirement_tags = CharField(widget=HiddenInput, required=False)
    requirement_delete = CharField(widget=HiddenInput, required=False)
