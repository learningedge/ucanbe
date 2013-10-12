# -*- coding: utf-8 -*-
import bottlenose
import xml.etree.cElementTree as etree

from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from django.contrib.contenttypes.models import ContentType

from settings import AMAZON_KEY, AMAZON_SECRET, AMAZON_ASSOC_ID
from research.tagger.forms import AmazonCachedItemForm, \
    AmazonCachedItemSearchForm, TaggingForm
from research.tagger.models import AmazonCachedItem, Supplier, Item, \
    AffinityTag, RequirementTag, AmazonCachedImage

from taggit.models import Tag #@UnresolvedImport
from ucb.research.tagger.models import RequirementTaggedItem,\
    AffinityTaggedItem
from ucb.research.tagger.forms import AmazonCachedItemDeleteFormset
from django.contrib.auth.decorators import login_required


AMZN_NS = "{http://webservices.amazon.com/AWSECommerceService/2011-08-01}"
ITEM_LOOKUP = \
    '%sItems/%sItem' \
    % tuple([AMZN_NS]*2)
ASIN_LOOKUP = \
    '%sASIN' \
    % AMZN_NS
DETAIL_PAGE_URL_LOOKUP = \
    '%sDetailPageURL' \
    % AMZN_NS
TITLE_LOOKUP = \
    '%sItemAttributes/%sTitle' \
    % tuple([AMZN_NS]*2)
CONTENT_LOOKUP = \
    './/%sEditorialReview/%sContent' % tuple([AMZN_NS]*2)
SMALL_IMAGE_LOOKUP = \
    './/%sSmallImage' % AMZN_NS
LARGE_IMAGE_LOOKUP = \
    './/%sLargeImage' % AMZN_NS
MAX_AGE_LOOKUP = \
    './/%sManufacturerMaximumAge' % AMZN_NS
MIN_AGE_LOOKUP = \
    './/%sManufacturerMinimumAge' % AMZN_NS
UPC_LOOKUP = \
    './/%sUPC' % AMZN_NS
EAN_LOOKUP = \
    './/%sEAN' % AMZN_NS
PRICE_LOOKUP = \
    './/%sPrice/%sAmount' % tuple([AMZN_NS]*2)
BRAND_LOOKUP = \
    '%sItemAttributes/%sBrand' \
    % tuple([AMZN_NS]*2)
LABEL_LOOKUP = \
    '%sItemAttributes/%sLabel' \
    % tuple([AMZN_NS]*2)
PUBLISHER_LOOKUP = \
    '%sItemAttributes/%sPublisher' \
    % tuple([AMZN_NS]*2)
MANUFACTURER_LOOKUP = \
    '%sItemAttributes/%sManufacturer' \
    % tuple([AMZN_NS]*2)
STUDIO_LOOKUP = \
    '%sItemAttributes/%sStudio' \
    % tuple([AMZN_NS]*2)
BROWSE_NODE_LOOKUP = \
    './/%sBrowseNode/%sName' % tuple([AMZN_NS]*2)

AMAZON_SUPPLIER = Supplier.objects.get_or_create(name="Amazon")[0]

def add_item_by_asin(asin):
    product_dict = get_item(asin)
    return add_item(product_dict)

def add_items_by_search(term, search_index, offset=1, min_age=None, max_age=None):
    product_dicts = get_items(term, search_index, offset)
    items = []
    for product_dict in product_dicts:
        if product_dict['min_age'] \
            and min_age is not None\
            and int(product_dict['min_age']) < min_age:
            continue
        if product_dict['max_age'] \
            and max_age is not None\
            and int(product_dict['max_age']) > max_age:
            continue
        items.append(add_item(product_dict))
    return items

def add_item(product_dict, recache=False):
    if product_dict['small_image'] is not None:
        product_dict['small_image'] = AmazonCachedImage.objects.get_or_create(url=product_dict['small_image']['url'],
            height=product_dict['small_image']['height'],
            width=product_dict['small_image']['width'])
    else:
        del product_dict['small_image']
    if product_dict['large_image'] is not None:
        product_dict['large_image'] = AmazonCachedImage.objects.get_or_create(url=product_dict['large_image']['url'],
            height=product_dict['large_image']['height'],
            width=product_dict['large_image']['width'])
    else:
        del product_dict['large_image']
    old_items = AmazonCachedItem.objects.filter(asin=product_dict['asin'])
    for old_item in old_items:
        old_item.delete()
    
    item = AmazonCachedItem(**product_dict)
    if item.is_valid():
        item.save()
        if not recache:
            stored_item, item_created = Item.objects.get_or_create(source_id=product_dict['asin'],
                                                                  supplier=AMAZON_SUPPLIER)
            return (item, stored_item)
        else:
            return (item, None)
    else:
        return (None, None)

def get_item(asin):
    xml = lookup_amazon(asin)
    docs = parse_item_search_response(xml)
    return parse_item_list(docs)[0]

def get_items(term, search_index, offset=1):
    xml = search_amazon(term, "Large", search_index, offset)
    docs = parse_item_search_response(xml)
    return parse_item_list(docs)

def lookup_amazon(asin, response_group = "Large"):
    # looks up items from Amazon product api
    #e.g. B0006ZZB0I
    amazon = bottlenose.Amazon(AMAZON_KEY, 
                               AMAZON_SECRET, 
                               AMAZON_ASSOC_ID)
    xml = amazon.ItemLookup(ItemId=asin, 
                            ResponseGroup=response_group)
    return xml

def search_amazon(term, response_group = "Large", search_index="Toys", offset=1):
    amazon = bottlenose.Amazon(AMAZON_KEY, 
                               AMAZON_SECRET, 
                               AMAZON_ASSOC_ID)
    xml = amazon.ItemSearch(Keywords=term, ResponseGroup=response_group, SearchIndex=search_index, ItemPage=offset)
    return xml

def parse_item_search_response(xml):
    if xml is None:
        return {}
    if isinstance(xml, unicode):
        product_doc = etree.fromstring(xml.encode('utf8'))
    else:
        product_doc = etree.fromstring(unicode(xml, errors='ignore'))
    return product_doc.findall(ITEM_LOOKUP)

def parse_item_list(items):
    product_docs = []
    for item in items:
        product_docs.append(parse_item(item))
    return product_docs

def parse_item(item):
    asin = item.find(ASIN_LOOKUP).text
    detail_page_url = item.find(DETAIL_PAGE_URL_LOOKUP).text
    titles = [t.text for t in item.findall(TITLE_LOOKUP)]
    contents = [c.text for c in item.findall(CONTENT_LOOKUP)]
    if len(contents) == 0:
        contents = [""]

    browse_nodes = ", ".join([b.text for b in item.findall(BROWSE_NODE_LOOKUP)])
    
    max_age = "" 
    max_age_element = item.find(MAX_AGE_LOOKUP)
    if max_age_element is not None:
        max_age = max_age_element.text
    min_age = "" 
    min_age_element = item.find(MIN_AGE_LOOKUP)
    if min_age_element is not None:
        min_age = min_age_element.text

    upc = ""
    upc_element = item.find(UPC_LOOKUP)
    if upc_element is not None:
        upc = upc_element.text
    
    ean = ""
    ean_element = item.find(EAN_LOOKUP)
    if ean_element is not None:
        ean = ean_element.text
    
    price = ""
    price_element = item.find(PRICE_LOOKUP)
    if price_element is not None:
        price = price_element.text
    
    brand = ""
    brand_element = item.find(BRAND_LOOKUP)
    if brand_element is not None:
        brand = brand_element.text
    
    label = ""
    label_element = item.find(LABEL_LOOKUP)
    if label_element is not None:
        label = label_element.text
    
    publisher = ""
    publisher_element = item.find(PUBLISHER_LOOKUP)
    if publisher_element is not None:
        publisher = publisher_element.text
    
    manufacturer = ""
    manufacturer_element = item.find(MANUFACTURER_LOOKUP)
    if manufacturer_element is not None:
        manufacturer = manufacturer_element.text
    
    studio = ""
    studio_element = item.find(STUDIO_LOOKUP)
    if studio_element is not None:
        studio = studio_element.text

    small_image_element = item.find(SMALL_IMAGE_LOOKUP)
    small_image = None
    if small_image_element and len(small_image_element) > 0:
        small_image = {}
        small_image['url'] = \
            small_image_element.find('%sURL' % AMZN_NS).text
        small_image['width'] = \
            small_image_element.find('%sWidth' % AMZN_NS).text
        small_image['height'] = \
            small_image_element.find('%sHeight' % AMZN_NS).text

    large_image_element = item.find(LARGE_IMAGE_LOOKUP)
    large_image = None
    if large_image_element and len(large_image_element) > 0:
        large_image = {}
        large_image['url'] = \
            large_image_element.find('%sURL' % AMZN_NS).text
        large_image['width'] = \
            large_image_element.find('%sWidth' % AMZN_NS).text
        large_image['height'] = \
            large_image_element.find('%sHeight' % AMZN_NS).text

    return {'asin':asin,
            'detail_page_url':detail_page_url,
            'large_image':large_image,
            'small_image':small_image,
            'contents': contents[0],
            'title': titles[0],
            'min_age': min_age,
            'max_age': max_age,
            'upc': upc,
            'ean': ean,
            'price': price,
            'brand': brand,
            'label': label,
            'publisher': publisher,
            'manufacturer': manufacturer,
            'studio': studio,
            'browse_nodes': browse_nodes}

@login_required
def add_amazon_cached_item(request):
    "adds a new amazon item to the cache, if available"
    if request.method == "POST":
        form = AmazonCachedItemForm(request.POST)
        if form.is_valid():
            asin = form.cleaned_data['asin']
            amazon_items = AmazonCachedItem.objects.filter(asin=asin)
            if len(amazon_items) == 0:
                item = None
                xml = lookup_amazon(asin)
            else:
                item = amazon_items[0]
                xml = item.xml
                if xml is None:
                    xml = lookup_amazon(item.asin)
                    item.xml = xml
                    item.save()
            if isinstance(xml, unicode):
                item_element = parse_item_search_response(xml)[0]
                product_dict = parse_item(item_element)
            else:
                item_element = parse_item_search_response(unicode(xml, 'UTF-8'))[0]
                product_dict = parse_item(item_element)
            if item is None:
                small_image = AmazonCachedImage.objects.get_or_create(url=product_dict['small_image']['url'],
                    height=product_dict['small_image']['height'],
                    width=product_dict['small_image']['width'])
                large_image = AmazonCachedImage.objects.get_or_create(url=product_dict['large_image']['url'],
                    height=product_dict['large_image']['height'],
                    width=product_dict['large_image']['width'])
                item = AmazonCachedItem(asin=asin,
                                        detail_page_url=product_dict['detail_page_url'],
                                        title=product_dict['title'],
                                        contents = product_dict['contents'],
                                        small_image = small_image,
                                        large_image = large_image,
                                        min_age = product_dict['min_age'],
                                        max_age = product_dict['max_age'],
                                        upc = product_dict['upc'],
                                        ean = product_dict['ean'],
                                        price = product_dict['price'],
                                        brand = product_dict['brand'],
                                        label = product_dict['label'],
                                        publisher = product_dict['publisher'],
                                        manufacturer = product_dict['manufacturer'],
                                        studio = product_dict['studio'],
                                        browse_nodes = product_dict['browse_nodes'],
                                        xml=xml)
                if item.is_valid():
                    item.save()
                else:
                    print item.errors
            supplier, supplier_created = Supplier.objects.get_or_create(name="Amazon")
            stored_item, item_created = Item.objects.get_or_create(source_id=asin,
                                                              supplier=supplier)
            data_dict = {'asin':asin, 
                        'form':form, 
                        'stored_item': stored_item}
            data_dict.update(product_dict)
            return render_to_response("research/tagger/add_item.html", 
                                      data_dict,
                                      context_instance=RequestContext(request))
        else:
            asin = "invalid"
    else:
        form = AmazonCachedItemForm()
        asin = "not recvd"
    return render_to_response("research/tagger/add_item.html", 
                              {'asin':asin, 
                               'form':form},
                              context_instance=RequestContext(request))

@login_required
def add_amazon_cached_item_by_search(request):
    "adds a new amazon item to the cache, if available"
    if request.method == "POST":
        form = AmazonCachedItemSearchForm(request.POST)
        results = []
        if form.is_valid():
            term = form.cleaned_data['term']
            search_index = form.cleaned_data['search_index']
            min_age = int(float(form.cleaned_data['min_age']) * 12)
            max_age = int(float(form.cleaned_data['max_age']) * 12)
            results = []
            for offset in range(10):
                results.extend([result[0] for result in add_items_by_search(term,
                                                                       search_index,
                                                                       offset,
                                                                       min_age,
                                                                       max_age)])
            results_count = len(results)
            delete_formset_data = {'form-TOTAL_FORMS': results_count,
                         'form-INITIAL_FORMS': u'0',
                         'form-MAX_NUM_FORMS': u'',
                         }
            for index,result in enumerate(results):
                delete_formset_data["form-%d-asin" % (index)] = result.asin
                delete_formset_data["form-%d-delete" % (index)] = False
            return render_to_response("research/tagger/add_items_by_search.html",
                                      {'form': form,
                                       'delete_formset': AmazonCachedItemDeleteFormset(delete_formset_data),
                                       'results': results},
                                      context_instance=RequestContext(request))
    else:
        form = AmazonCachedItemSearchForm()
    return render_to_response("research/tagger/add_items_by_search.html", 
                              {'results':[], 
                               'form':form},
                              context_instance=RequestContext(request))

@login_required
def delete_amazon_cached_items(request):
    if request.method == "POST":
        formset = AmazonCachedItemDeleteFormset(request.POST)
        if formset.is_valid():
            for form in formset:
                if form.cleaned_data["delete"] == True:
                    aci = AmazonCachedItem.objects.filter(asin=form.cleaned_data["asin"])[0]
                    aci.permanent_delete()
        else:
            print formset.errors
    
    return HttpResponseRedirect(reverse("tagger_add_amazon_cached_item_by_search"))

@login_required
def detail_amazon_cached_item(request, asin):
    """ Produces a list of the AMZN amazon_items in redis cache"""
    amazon_items = AmazonCachedItem.objects.filter(asin=asin)
    
    item = Item.objects.get(source_id=asin)
    content_type = ContentType.objects.get_for_model(item)
    affinity_tags = item.affinity_tags.all().order_by('-canonical','name')
    requirement_tags = item.requirement_tags.all().order_by('-canonical','name')
    requirement_tagged_items = RequirementTaggedItem.objects.filter(
            content_type=content_type,
            object_id=item.id)
    
    if len(amazon_items) > 0:
        amazon_item = amazon_items[0]
        if amazon_item.price:
            amazon_item.price = int(amazon_item.price) / 100.0
        if amazon_item.min_age:
            amazon_item.min_age = int(amazon_item.min_age) / 12
        if amazon_item.max_age:
            amazon_item.max_age = int(amazon_item.max_age) / 12
    else:
        amazon_item = None

    if request.method == "POST":
        form = TaggingForm(request.POST)
        if form.is_valid():
            old_affinity_tags = form.cleaned_data['affinity_delete']
            if len(old_affinity_tags) > 0 and old_affinity_tags.strip()[-1] == ",":
                old_affinity_tags = old_affinity_tags.strip()[:-1]
            old_affinity_tags = [tag.strip() for tag in old_affinity_tags.split(',')]
            print old_affinity_tags
            for old_affinity_tag in old_affinity_tags:
                tagged_item = AffinityTaggedItem.objects.filter( content_type=content_type,
                            object_id=item.id,
                            tag__name=old_affinity_tag)
                tagged_item.delete()
            
            new_affinity_tags = form.cleaned_data['affinity_tags']
            if len(new_affinity_tags) > 0 and new_affinity_tags.strip()[-1] == ",":
                new_affinity_tags = new_affinity_tags.strip()[:-1]
            new_affinity_tags = [tag.strip() for tag in new_affinity_tags.split(',')]
            item.affinity_tags.add(*new_affinity_tags)
            for new_affinity_tag in new_affinity_tags:
                tag = AffinityTag.objects.get_or_create(name=new_affinity_tag)[0]
                tagged_item = AffinityTaggedItem.objects.get_or_create( content_type=content_type,
                            object_id=item.id,
                            tag=tag,
                            user=request.user)
            
            old_requirement_tags = form.cleaned_data['requirement_delete']
            if len(old_requirement_tags) > 0:
                if old_requirement_tags.strip()[-1] == ",":
                    old_requirement_tags = old_requirement_tags.strip()[:-1]
                old_requirement_tags = [tag.strip().split("::") for tag in old_requirement_tags.split(',')]
                for old_requirement_tag in old_requirement_tags:
                    tagged_item = RequirementTaggedItem.objects.filter(
                                                content_type=content_type,
                                                object_id=item.id,
                                                tag__name=old_requirement_tag[0], 
                                                level=old_requirement_tag[1])
                    tagged_item.delete()
                            
            new_requirement_tags = form.cleaned_data['requirement_tags']
            if len(new_requirement_tags) > 0:
                if new_requirement_tags.strip()[-1] == ",":
                    new_requirement_tags = new_requirement_tags.strip()[:-1]
                new_requirement_tags = [tag.strip().split("::") for tag in new_requirement_tags.split(',')]
                for new_requirement_tag in new_requirement_tags:
                    tag = RequirementTag.objects.get_or_create(name=new_requirement_tag[0])[0]
                    tagged_item = RequirementTaggedItem.objects.get_or_create(
                            content_type=content_type,
                            object_id=item.id,
                            level=new_requirement_tag[1],
                            tag=tag,
                            user=request.user
                            )[0]

            random_item = Item.objects.order_by("?")[0]
            return HttpResponseRedirect(reverse("tagger_detail_amazon_cached_item",
                kwargs={'asin': random_item.source_id}))
            #item.requirement_tags.add(*new_requirement_tags) 
    else:
        form = TaggingForm()

    product_dict = {'form': form,
                    'cache': amazon_item,
                    'affinity_tags': affinity_tags,
                    'requirement_tags': requirement_tags,
                    'requirement_tagged_items': requirement_tagged_items}

    return render_to_response("research/tagger/detail_item.html", 
                              product_dict,
                              context_instance=RequestContext(request))

def list_amazon_cached_items(request):
    """ Produces a list of the AMZN amazon_items in redis cache"""
    results = AmazonCachedItem.objects.all().order("title")
    results_count = len(results)
    delete_formset_data = {'form-TOTAL_FORMS': results_count,
                 'form-INITIAL_FORMS': u'0',
                 'form-MAX_NUM_FORMS': u'',
                 }
    for index,result in enumerate(results):
        delete_formset_data["form-%d-asin" % (index)] = result.asin
        delete_formset_data["form-%d-delete" % (index)] = False
    return render_to_response("research/tagger/list_items.html", 
                              {"results": results,
                               'delete_formset': AmazonCachedItemDeleteFormset(delete_formset_data),
                               },
                              context_instance=RequestContext(request))

def list_tags_json(request):
    """ Produces a list of the AMZN amazon_items in redis cache"""
    if request.GET.has_key("term"):
        term = request.GET["term"]
        tags = Tag.objects.filter(name__icontains=term).order_by("name")
    else:
        tags = Tag.objects.all().order_by("name")
        
    return render_to_response("research/tagger/list_tags.json", 
                              {"tags": tags},
                              context_instance=RequestContext(request))

def list_affinity_tags_json(request):
    """ Produces a list of the AMZN amazon_items in redis cache"""
    if request.GET.has_key("term"):
        term = request.GET["term"]
        tags = AffinityTag.objects.filter(name__icontains=term, canonical=True).order_by("name")
    else:
        tags = AffinityTag.objects.filter(canonical=True).order_by("name")
        
    return render_to_response("research/tagger/list_tags.json", 
                              {"tags": tags},
                              context_instance=RequestContext(request))

def list_requirement_tags_json(request):
    """ Produces a list of the AMZN amazon_items in redis cache"""
    if request.GET.has_key("term"):
        term = request.GET["term"]
        tags = RequirementTag.objects.filter(name__icontains=term, canonical=True).order_by("name")
    else:
        tags = RequirementTag.objects.filter(canonical=True).order_by("name")
        
    return render_to_response("research/tagger/list_tags.json", 
                              {"tags": tags},
                              context_instance=RequestContext(request))
