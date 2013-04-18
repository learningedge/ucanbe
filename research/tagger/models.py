from django.db import models
import redisco.models
from django_extensions.db.models import TimeStampedModel
from taggit.managers import TaggableManager 
from taggit.models import TagBase, GenericTaggedItemBase 
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType

class AmazonCachedImage(redisco.models.Model):
    """
    Collects Amazon image details into the temp cache
    
    """
    url = redisco.models.Attribute(required=True)
    created = redisco.models.DateTimeField(auto_now_add=True)
    height = redisco.models.Attribute(required=True)
    width = redisco.models.Attribute(required=True)

class AmazonCachedItem(redisco.models.Model):
    """
    Collects Amazon items into the temp cache
    
    """
    asin = redisco.models.Attribute(required=True)
    detail_page_url = redisco.models.Attribute()
    created = redisco.models.DateTimeField(auto_now_add=True)
    title = redisco.models.Attribute(required=True)
    small_image = redisco.models.ReferenceField(AmazonCachedImage)
    large_image = redisco.models.ReferenceField(AmazonCachedImage)
    contents = redisco.models.Attribute()
    title = redisco.models.Attribute()
    min_age = redisco.models.Attribute()
    max_age = redisco.models.Attribute()
    upc = redisco.models.Attribute()
    ean = redisco.models.Attribute()
    price = redisco.models.Attribute()
    brand = redisco.models.Attribute()
    label = redisco.models.Attribute()
    publisher = redisco.models.Attribute()
    manufacturer = redisco.models.Attribute()
    studio = redisco.models.Attribute()
    xml = redisco.models.Attribute()
    browse_nodes = redisco.models.Attribute()
    
    def permanent_delete(self):
        item = Item.objects.get(source_id=self.asin, supplier__name="Amazon")
        item.delete()
        self.delete()

    def __unicode__(self):
        return u"%s" % (self.title)

class Supplier(TimeStampedModel):
    name = models.CharField(max_length=256)

    def __unicode__(self):
        return u"%s" % (self.name)

class AffinityTag(TagBase):
    canonical = models.BooleanField(default=False)
    description = models.TextField(null=True, blank=True)

class AffinityTaggedItem(GenericTaggedItemBase):
    tag = models.ForeignKey(AffinityTag, related_name="tagged_items")
    user = models.ForeignKey(User, related_name="affinity_tagged_items", null=True, blank=True)

    @classmethod
    def lookup_kwargs(cls, instance):
        return {
            'object_id': instance.pk,
            'content_type': ContentType.objects.get_for_model(instance),
            'user': None
        }


class RequirementTag(TagBase):
    canonical = models.BooleanField(default=False)
    description = models.TextField(null=True, blank=True)

class RequirementTaggedItem(GenericTaggedItemBase):
    tag = models.ForeignKey(RequirementTag, related_name="tagged_items")
    level = models.IntegerField(default=0)
    user = models.ForeignKey(User, related_name="requirement_tagged_items", null=True, blank=True)

    @classmethod
    def lookup_kwargs(cls, instance):
        return {
            'object_id': instance.pk,
            'content_type': ContentType.objects.get_for_model(instance),
            'level': None,
            'user': None
        }


class Item(TimeStampedModel):
    source_id = models.CharField(max_length=256)
    supplier = models.ForeignKey(Supplier, related_name="items")

    affinity_tags = TaggableManager(through=AffinityTaggedItem)
    requirement_tags = TaggableManager(through=RequirementTaggedItem)

    def __unicode__(self):
        return u"%s" % (self.source_id)
