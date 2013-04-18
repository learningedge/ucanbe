"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.

pylint option block-disable"""
#pylint: disable=C0103,C0301,R0904

from django.test import TestCase
from research.learnoffer.models import OfferingStory
from research.learnoffer.models import AssociationTag, StoryTemplate, \
    LearnerStory, LearnerWorkerTest
from django.test.client import Client


class OfferingStoryTest(TestCase):
    """Tests the offering types."""

    def setUp(self): 
        self.o1 = OfferingStory.objects.create(title="test 1")
        self.o1.add_tag("offering::type::toy")
        self.o1.add_template(root_tag=AssociationTag.objects.get(title="offering"),
                             body="This is a [[offering::type]] offering for someone who is [[offering::age range]] years old.")
            
    def test_creation(self):
        """Tests if story was created"""
        self.assertEqual(self.o1.title, "test 1", "Offer #1 title incorrect")
        
    def test_add_tags(self):
        """Tests for adding tags using strings"""
        offering_tag = AssociationTag.objects.get(title="offering")
        type_tag = AssociationTag.objects.get(title="type", parent__title="offering")
        self.assertEqual(offering_tag.title, type_tag.parent.title, "Grandparent/Parent tag titles don't match")
        toy_tag = AssociationTag.objects.get(title="toy", parent__title="type", parent__parent__title="offering")
        self.assertEqual(type_tag.title, toy_tag.parent.title, "Parent tag title doesn't match")
        self.assertEqual(offering_tag.title, toy_tag.parent.parent.title, "Grandparent tag title doesn't match")
        
        self.o1.add_tag("offering::age range::5-7")
        age_range_tag = AssociationTag.objects.get(title="age range", parent__title="offering")
        five_seven_tag = AssociationTag.objects.get(title="5-7", parent__title="age range")
        self.assertEqual(offering_tag, age_range_tag.parent, "Existing Grandparent/New Parent tags don't match")
        self.assertEqual(offering_tag, five_seven_tag.parent.parent, "Existing Grandparent tag doesn't match")
        self.o1.delete_tag("offering::age range::5-7")

        tag = self.o1.add_tag("offering::age range")
        self.assertEqual(tag, None, "Tag addition is not leaf node")
        
        
    def test_delete_tags(self):
        """Tests for deleting tags from offerings using strings"""
        self.o1.add_tag("offering::age range::6-8")
        self.assertEqual(self.o1.associations.filter(tag__title="6-8").count(), 1)
        
        self.o1.delete_tag("offering::age range::6-8")
        self.assertEqual(self.o1.associations.filter(tag__title="6-8").count(), 0)
        
    def test_template_simple(self):
        """Tests a simple set of tags."""
        self.o1.add_tag("offering::age range::5-7")

        text = self.o1.get_story_text(self.o1.templates.all()[0])
        
        simple_test_story = u"""This is a toy offering for someone who is 5-7 years old."""
        
        self.assertEqual(text, simple_test_story, "The simple stories do not match")
        self.o1.delete_tag("offering::age range::5-7")
        
    def test_template_complex(self):
        """Tests a complex set of tags."""
        self.o1.add_tag("offering::age range::5-7")
        self.o1.add_tag("offering::age range::7-10")
        self.o1.add_tag("offering::type::kit")

        text = self.o1.get_story_text(self.o1.templates.all()[0])
        
        simple_test_story = u"""This is a kit, toy offering for someone who is 5-7, 7-10 years old."""
        
        self.assertEqual(text, simple_test_story, "The complex stories do not match")
        self.o1.delete_tag("offering::age range::5-7")
        self.o1.delete_tag("offering::age range::7-10")
        self.o1.delete_tag("offering::type::kit")
        
    def test_create_story(self):
        """Tests creating a story from a template."""
        self.o1.add_tag("offering::age range::5-7")
        self.o1.add_tag("offering::age range::7-10")
        self.o1.add_tag("offering::type::kit")

        template = StoryTemplate.objects.filter(root_tag__title="offering")[0]
        o2 = OfferingStory.create_random_story(template=template)

        self.assertNotEqual(o2.get_story_text(template), None, "The random story was not rendered.")
        self.assertTrue(isinstance(o2, OfferingStory), "Story is not an offering story.")

        self.o1.delete_tag("offering::age range::5-7")
        self.o1.delete_tag("offering::age range::7-10")
        self.o1.delete_tag("offering::type::kit")
        o2.delete()

    def tearDown(self):
        self.o1.templates.all().delete()
        self.o1.delete_tag("offering::type::toy")
        
class LearnerStoryTest(TestCase):
    """Tests the offering types."""

    def setUp(self): 
        self.o1 = LearnerStory.objects.create(title="test 1")
        self.o1.add_tag("learner::style::individual")
        self.o1.add_template(root_tag=AssociationTag.objects.get(title="learner"),
                             body="This is a [[learner::style]] learner who is [[learner::age]] years old.")
            
    def test_creation(self):
        """Tests if story was created"""
        self.assertEqual(self.o1.title, "test 1", "Offer #1 title incorrect")
        
    def test_add_tags(self):
        """Tests for adding tags using strings"""
        learner_tag = AssociationTag.objects.get(title="learner")
        style_tag = AssociationTag.objects.get(title="style", parent__title="learner")
        self.assertEqual(learner_tag.title, style_tag.parent.title, "Grandparent/Parent tag titles don't match")
        individual_tag = AssociationTag.objects.get(title="individual", parent__title="style", parent__parent__title="learner")
        self.assertEqual(style_tag.title, individual_tag.parent.title, "Parent tag title doesn't match")
        self.assertEqual(learner_tag.title, individual_tag.parent.parent.title, "Grandparent tag title doesn't match")
        
        self.o1.add_tag("learner::age::7")
        age_tag = AssociationTag.objects.get(title="age", parent__title="learner")
        seven_tag = AssociationTag.objects.get(title="7", parent__title="age")
        self.assertEqual(learner_tag, age_tag.parent, "Existing Grandparent/New Parent tags don't match")
        self.assertEqual(learner_tag, seven_tag.parent.parent, "Existing Grandparent tag doesn't match")
        self.o1.delete_tag("learner::age::7")

        tag = self.o1.add_tag("learner::age")
        self.assertEqual(tag, None, "Tag addition is not leaf node")
        
        
    def test_delete_tags(self):
        """Tests for deleting tags from offerings using strings"""
        self.o1.add_tag("learner::age::6")
        self.assertEqual(self.o1.associations.filter(tag__title="6").count(), 1)
        
        self.o1.delete_tag("learner::age::6")
        self.assertEqual(self.o1.associations.filter(tag__title="6").count(), 0)
        
    def test_template_simple(self):
        """Tests a simple set of tags."""
        self.o1.add_tag("learner::age::7")

        template = StoryTemplate.objects.filter(root_tag__title="learner")[0]
        text = self.o1.get_story_text(template)
        
        simple_test_story = u"""This is a individual learner who is 7 years old."""
        
        self.assertEqual(text, simple_test_story, "The simple stories do not match")
        self.o1.delete_tag("offering::age::7")
        
    def test_template_complex(self):
        """Tests a complex set of tags."""
        self.o1.add_tag("learner::age::7")
        self.o1.add_tag("learner::style::collaborative")

        template = StoryTemplate.objects.filter(root_tag__title="learner")[0]
        text = self.o1.get_story_text(template)
        
        simple_test_story = u"""This is a collaborative, individual learner who is 7 years old."""
        
        self.assertEqual(text, simple_test_story, "The complex stories do not match")
        self.o1.delete_tag("learner::age::7")
        self.o1.delete_tag("learner::age::10")
        self.o1.delete_tag("learner::style::collaborative")

    def test_create_story(self):
        """Tests creating a story from a template."""
        self.o1.add_tag("learner::age::7")
        self.o1.add_tag("learner::age::10")
        self.o1.add_tag("learner::style::collaborative")

        template = StoryTemplate.objects.filter(root_tag__title="learner")[0]
        o2 = LearnerStory.create_random_story(template=template)

        self.assertNotEqual(o2.get_story_text(template), None, "The random story was not rendered.")
        self.assertTrue(isinstance(o2, LearnerStory), "Story is not a learner story.")

        self.o1.delete_tag("learner::age::7")
        self.o1.delete_tag("learner::age::10")
        self.o1.delete_tag("learner::style::collaborative")
        o2.delete()
        
    def tearDown(self):
        self.o1.templates.all().delete()
        self.o1.delete_tag("learner::style::individual")
        
class WorkerTest(TestCase):
    """Tests the interface for the mturk workers."""
    
    def setUp(self):
        self.learner_tags = []
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::age::7"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::age::9"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::age::11"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::age::14"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::style::collaborative"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::style::individual"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::style::background"))
        self.learner_tags.append(AssociationTag.get_or_create_full_tag("learner::style::domination"))

        self.offering_tags = []
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::age range::5-7"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::age range::7-10"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::age range::10-12"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::age range::12-15"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::type::kit"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::type::toy"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::type::video"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::type::book"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::type::experiment"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::type::project"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::completion time::1 hour"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::completion time::1/2 day"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::completion time::1 day"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::completion time::3 days"))
        self.offering_tags.append(AssociationTag.get_or_create_full_tag("offering::completion time::1 week"))

        self.learner_template = StoryTemplate.objects.create(root_tag=AssociationTag.objects.get(title="learner"),
                                                     body="This is a [[learner::style]] learner who is [[learner::age]] years old.")
            
        self.offering_template = StoryTemplate.objects.create(root_tag=AssociationTag.objects.get(title="learner"),
                                                     body="""This is a [[offering::type]] offering 
                                                     for someone who is [[offering::age range]] years old.
                                                     It should take [[offering::completion time]] to complete.""")

        self.learner_story = LearnerStory.create_random_story(self.learner_template)
        self.learner_story.title = "Worker Test Learner Story"

    def test_create(self):
        """Tests the ability to create a new test matrix. """
        test_size = 8
        test = LearnerWorkerTest.objects.create(background_story=self.learner_story)
        test.create_matrix(dimension=test_size, template=self.offering_template)
        self.assertEqual(test.pairs.count(), 28, "In incorrect number of pairs have been created.")

class InterfaceTest(TestCase):
    """Tests for the custom admin and worker interfaces."""
    
    def setUp(self):
        self.client = Client()
        
    def testBulkTagAddition(self):
        """Tests adding tags in bulk. """
        tags = ["offering::color::red", "offering::color::blue", "learner::education::kindergarten"]
        response = self.client.post("/admin/association_tag/bulk/add/", {'bulk_tags': '\n'.join(tags)})
        self.assertEqual(response.status_code, 200, "Status code for bulk tag addition incorrect.") #pylint: disable=E1103

        created = AssociationTag.get_or_create_full_tag("offering::color::red")[1]
        self.assertFalse(created, "Bulk tag 1 not previously added")

        created = AssociationTag.get_or_create_full_tag("offering::color::blue")[1]
        self.assertFalse(created, "Bulk tag 2 not previously added")
        
        created = AssociationTag.get_or_create_full_tag("learner::education::kindergarten")[1]
        self.assertFalse(created, "Bulk tag 3 not previously added")

    def testBulkTagDeletion(self):
        """Tests deleting tags in bulk. """
        tags = ["offering::color::green", "offering::color::purple"]
        for tag in tags:
            AssociationTag.get_or_create_full_tag(tag)
        response = self.client.post("/admin/association_tag/bulk/delete/", {'bulk_tags': '\n'.join(tags)})
        self.assertEqual(response.status_code, 200, "Status code for bulk tag deletion incorrect.") #pylint: disable=E1103

        created = AssociationTag.get_or_create_full_tag("offering::color::green")[1]        
        self.assertTrue(created, "Bulk tag 1 not deleted")

        created = AssociationTag.get_or_create_full_tag("offering::color::purple")[1]        
        self.assertTrue(created, "Bulk tag 2 not deleted")
