from tastypie.resources import ModelResource, Resource
from tastypie.bundle import Bundle
from tastypie import fields
from research.tagger.models import AffinityTag, RequirementTag, \
    Item, AmazonCachedItem, Supplier, RequirementTaggedItem
from tastypie.constants import ALL_WITH_RELATIONS

class AffinityTagResource(ModelResource):
    class Meta:
        queryset = AffinityTag.objects.all()
        resource_name = "affinity_tag"

class AmazonCachedItemResource(Resource):
    asin = fields.CharField(attribute="asin")
    title = fields.CharField(attribute="title")
    created = fields.DateTimeField(attribute="created")    
    #xml = fields.CharField(attribute="xml")

    class Meta:
        resource_name = "amazon_cached_item"
        object_class = AmazonCachedItem

    def get_resource_uri(self, bundle_or_obj):
        kwargs = {
            'resource_name': self._meta.resource_name,
        }

        if isinstance(bundle_or_obj, Bundle):
            kwargs['pk'] = bundle_or_obj.obj.asin
        else:
            kwargs['pk'] = bundle_or_obj.asin

        if self._meta.api_name is not None:
            kwargs['api_name'] = self._meta.api_name

        return self._build_reverse_url("api_dispatch_detail", kwargs=kwargs)

    def obj_get(self, request=None, **kwargs):
        try:
            return self._meta.object_class.objects.filter(asin=kwargs['pk'])[0]
        except IndexError:
            from tastypie.exceptions import NotFound
            raise NotFound("Sorry, not found.")

    def get_object_list(self, request=None, **kwargs):
        return self._meta.object_class.objects.all()

    def obj_get_list(self, request=None, **kwargs):
        return self.get_object_list(request)

class SupplierResource(ModelResource):
    class Meta:
        queryset = Supplier.objects.all()
        resource_name = "supplier"

class ItemResource(ModelResource):
    supplier = fields.ToOneField(SupplierResource, 'supplier', full=True)

    class Meta:
        queryset = Item.objects.all()
        resource_name = "item"

class RequirementTaggedItemResource(ModelResource):
    class Meta:
        queryset = RequirementTaggedItem.objects.all()
        resource_name = "requirement_tagged_item"

class RequirementTagResource(ModelResource):
    #items = fields.ForeignKey(RequirementTaggedItemResource, "tagged_items")
    class Meta:
        queryset = RequirementTag.objects.all()
        resource_name = "requirement_tag"
        filtering = {
            'name': ALL_WITH_RELATIONS
        }
