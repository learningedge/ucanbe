from django.conf.urls.defaults import *
from django.views.generic.base import TemplateView
from tastypie.api import Api
from api import AffinityTagResource, RequirementTagResource, \
    ItemResource, AmazonCachedItemResource, SupplierResource

v1_api = Api(api_name='v1')
v1_api.register(AffinityTagResource())
v1_api.register(AmazonCachedItemResource())
v1_api.register(ItemResource())
v1_api.register(RequirementTagResource())
v1_api.register(SupplierResource())

urlpatterns = patterns("",
    url(r"^amazon/cached/add/$", 
        "research.tagger.views.add_amazon_cached_item", 
        name="tagger_add_amazon_cached_item"),
    url(r"^amazon/cached/add/by_search/$", 
        "research.tagger.views.add_amazon_cached_item_by_search", 
        name="tagger_add_amazon_cached_item_by_search"),
    url(r"^amazon/cached/delete/$", 
        "research.tagger.views.delete_amazon_cached_items", 
        name="tagger_add_amazon_cached_item_delete"),
    url(r"^amazon/cached/list/$", 
        "research.tagger.views.list_amazon_cached_items", 
        name="tagger_list_amazon_cached_items"),
    url(r"^amazon/cached/detail/(?P<asin>[A-Za-z0-9]+)/$", 
        "research.tagger.views.detail_amazon_cached_item", 
        name="tagger_detail_amazon_cached_item"),
    url(r"^tags/list/$",
        "research.tagger.views.list_tags_json",
        name="tagger_list_tags_json"),
    url(r"^tags/affinity/list/$",
        "research.tagger.views.list_affinity_tags_json",
        name="tagger_list_affinity_tags_json"),
    url(r"^tags/requirement/list/$",
        "research.tagger.views.list_requirement_tags_json",
        name="tagger_list_requirement_tags_json"),
    url(r"^api/", include(v1_api.urls)),
    url(r"^backbone/$", 
        TemplateView.as_view(template_name="research/tagger/backbone.html"),
        name="tagger_backbone"),
)
