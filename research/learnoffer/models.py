"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.

"""
from django.db import models
from django_extensions.db.models import TitleSlugDescriptionModel,\
    TimeStampedModel
from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey #pylint: disable=F0401,E0611
from django.db.models.fields import BigIntegerField, TextField
from django.db.models.fields.related import ForeignKey, ManyToManyField
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.generic import GenericForeignKey, \
    GenericRelation
import re
from django.db.models.fields.files import ImageField
import random

"""pylint option block-disable""" #pylint: disable=W0105
#pylint: disable=C0103,C0301,R0904

class AssociationTag(MPTTModel, TitleSlugDescriptionModel, TimeStampedModel):
    """Describes on object with the engine."""
    parent = TreeForeignKey("self", 
                            related_name="children", 
                            blank=True, 
                            null=True)
    
    objects = models.Manager()

    class MPTTMeta:
        order_insertion_by = ['title']
        #parent_attr = 'parent'
    
    
    def __unicode__(self):
        return u"%s" % (self.title) #("::".join([tag.title for tag in self.get_ancestors()].append(self.title)))

    def get_full_name(self):
        """Returns the full path name of the tag, up to its root."""
        return u"%s" % ("::".join([tag.title for tag in self.get_ancestors()] + [self.title]))

    @classmethod
    def get_or_create_full_tag(cls, full_name):
        """Get and creates association tags."""
        levels = full_name.split("::")
        parent = None
        created = False
        for level in levels:
            tag, _created = AssociationTag.objects.get_or_create(
                                                             title=level.strip().lower(),
                                                             parent=parent
                                                             )
            parent = tag
            created |= _created

        return parent, created


class Association(TimeStampedModel):
    """Pivot between tags and objects."""
    tag = ForeignKey(AssociationTag, related_name="associations")
    content_type = ForeignKey(ContentType, related_name="association_tags")
    object_id = BigIntegerField()
    content_object = GenericForeignKey('content_type','object_id')
    
    objects = models.Manager()

    def __unicode__(self):
        return u"%s->%s" % (self.tag.get_full_name(), self.content_object) #pylint: disable=E1101


class StoryTemplate(TimeStampedModel):
    """Story template."""
    body = TextField()
    root_tag = ForeignKey(AssociationTag, related_name="story_templates")
    
    objects = models.Manager()
    
    def __unicode__(self):
        return u"%s story: %s..." % (self.root_tag.title, self.body[0:30]) #pylint: disable=E1101


class Story(TitleSlugDescriptionModel, TimeStampedModel):
    """Story model for proxies and tags."""
    associations = GenericRelation(Association, related_name="stories")
    templates = ManyToManyField(StoryTemplate, related_name="stories", blank=True, null=True)
    
    objects = models.Manager()
    
    class Meta:
        verbose_name_plural = "stories"
    
    @classmethod
    def create_random_story(cls, template):
        """Creates a random story based on a template."""
        instance = None
        if template is not None:
            body = template.body
            categories = re.findall('\[\[([^\[\]]*)\]\]', body)
            tags = []
            for category in categories:
                levels = category.split("::")
                kwargs_keys = ["parent__" * index + "title" for index in range(len(levels)-1, -1, -1)]
                kwargs = dict(zip(kwargs_keys, levels))
                tag = random.choice(AssociationTag.objects.filter(**kwargs))
                tags.append(tag)
            instance = cls.objects.create()
            instance.templates.add(template)
            instance.save()
            for tag in tags:
                Association.objects.create(tag=tag, content_object=instance)
        
        return instance

    def __unicode__(self):
        return u"%s..." % (self.title) #pylint: disable=E1101        
    
    def add_tag(self, full_name):
        """Get and creates association tags."""
        tag = AssociationTag.get_or_create_full_tag(full_name)[0]
        content_type = ContentType.objects.get_for_model(self)
        if tag.is_leaf_node():
            Association.objects.get_or_create(
                                                 object_id=self.pk,
                                                 content_type=content_type,
                                                 tag=tag)
        else:
            tag = None
        
        return tag
    
    def delete_tag(self, full_name):
        """Deletes a tag."""
        levels = full_name.split("::")
        kwargs_keys = ["parent__" * index + "title" for index in range(len(levels)-1, -1, -1)]
        kwargs = dict(zip(kwargs_keys, levels))
        tags = AssociationTag.objects.filter(**kwargs)
        for tag in tags:
            associations = self.associations.filter(tag__title=tag.title) #pylint: disable=E1101
            if associations.count() > 0:
                associations.delete()
        
    def get_tag(self, full_name):
        """Returns a tag."""
        levels = full_name.split("::")
        kwargs_keys = ["parent__" * index + "title" for index in range(len(levels)-1, -1, -1)]
        kwargs = dict(zip(kwargs_keys, levels))
        content_type = ContentType.objects.get_for_model(self)
        kwargs.update({'assocations__object_id':self.pk, 'association__content_type':content_type})
        tags = AssociationTag.objects.filter(**kwargs)
        if len(tags) > 0:
            tag = tags[0]
        else:
            tag = None
        return tag
    
    def get_tags_by_category(self, full_name):
        """Deletes a tag."""
        levels = full_name.split("::")
        associations = self.associations.filter(tag__parent__title=levels[-1]).order_by("tag__title") #pylint: disable=E1101
        categories = []
        for association in associations:
            title = association.tag.title
            if title not in categories:
                categories.append(title)
        return categories

    def add_template(self, template=None, root_tag=None, body=None):
        """Adds or alters a story template"""
        if template is not None:
            self.templates.add(template) #pylint: disable=E1101
            self.save()
        if root_tag is not None and body is not None:
            self.templates.add(StoryTemplate.objects.get_or_create(root_tag=root_tag, body=body)[0]) #pylint: disable=E1101
            self.save()

    def delete_template(self, template):
        """Deletes a story template"""
        if template in self.templates:
            self.templates.remove(template) #pylint: disable=E1101
            self.save()

    def get_story_text(self, template):
        """Gets the text of the story by rendering the template with the tags."""
        if self.templates is not None and template in self.templates.all(): #pylint: disable=E1101
            body = template.body
            categories = re.findall('\[\[([^\[\]]*)\]\]', body)
            context = dict(zip(categories, [None] * len(categories)))
            for category in categories:
                context[category] = ', '.join(self.get_tags_by_category(category))
                body = body.replace("[[%s]]" % (category), context[category])
            if self.description is not None:
                body = self.description + " " + body
            return body
        else:
            return None


class OfferingStory(Story):
    """Story model for offerings."""
    image = ImageField(upload_to="research/learnoffer/offering_story/", blank=True, null=True)
    
    objects = models.Manager()

    class Meta:
        verbose_name_plural = "offering stories"
    

class LearnerStory(Story):
    """Story model for offerings."""
    
    objects = models.Manager()

    class Meta:
        verbose_name_plural = "learner stories"


class LearnerWorkerTest(TimeStampedModel):
    """Model for a set of pairwise comparisons between different stories."""
    background_story = ForeignKey(LearnerStory, related_name="worker_tests")
    
    objects = models.Manager()
    
    def __unicode__(self):
        return u"%s" % (self.background_story)
        
    def create_matrix(self, template=None, dimension=8):
        """Creates a set of pair-wise comparisons of stories for mturk workers to test."""
        stories = []
        for index in range(dimension):
            stories.append(OfferingStory.create_random_story(template=template))
        for i in range(dimension):
            for j in range(i+1, dimension):
                LearnerWorkerTestOfferingPair.objects.create(story=stories[i], other=stories[j], test=self)

class LearnerWorkerTestOfferingPair(TimeStampedModel):
    """Model for a pair of comparable stories."""
    story = ForeignKey(OfferingStory, related_name="story_worker_pairs")
    other = ForeignKey(OfferingStory, related_name="other_worker_pairs")
    test = ForeignKey(LearnerWorkerTest, related_name="pairs")
    
    objects = models.Manager()

    def __unicode__(self):
        return u"%s vs. %s" % (self.story[0:15], self.other[0:15])
        