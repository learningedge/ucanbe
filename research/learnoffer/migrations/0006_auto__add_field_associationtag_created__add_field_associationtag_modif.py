# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'AssociationTag.created'
        db.add_column('learnoffer_associationtag', 'created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'AssociationTag.modified'
        db.add_column('learnoffer_associationtag', 'modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'Story.created'
        db.add_column('learnoffer_story', 'created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'Story.modified'
        db.add_column('learnoffer_story', 'modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'LearnerWorkerTest.created'
        db.add_column('learnoffer_learnerworkertest', 'created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'LearnerWorkerTest.modified'
        db.add_column('learnoffer_learnerworkertest', 'modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'LearnerWorkerTestOfferingPair.created'
        db.add_column('learnoffer_learnerworkertestofferingpair', 'created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'LearnerWorkerTestOfferingPair.modified'
        db.add_column('learnoffer_learnerworkertestofferingpair', 'modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'StoryTemplate.created'
        db.add_column('learnoffer_storytemplate', 'created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'StoryTemplate.modified'
        db.add_column('learnoffer_storytemplate', 'modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'Association.created'
        db.add_column('learnoffer_association', 'created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)

        # Adding field 'Association.modified'
        db.add_column('learnoffer_association', 'modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True), keep_default=False)


    def backwards(self, orm):
        
        # Deleting field 'AssociationTag.created'
        db.delete_column('learnoffer_associationtag', 'created')

        # Deleting field 'AssociationTag.modified'
        db.delete_column('learnoffer_associationtag', 'modified')

        # Deleting field 'Story.created'
        db.delete_column('learnoffer_story', 'created')

        # Deleting field 'Story.modified'
        db.delete_column('learnoffer_story', 'modified')

        # Deleting field 'LearnerWorkerTest.created'
        db.delete_column('learnoffer_learnerworkertest', 'created')

        # Deleting field 'LearnerWorkerTest.modified'
        db.delete_column('learnoffer_learnerworkertest', 'modified')

        # Deleting field 'LearnerWorkerTestOfferingPair.created'
        db.delete_column('learnoffer_learnerworkertestofferingpair', 'created')

        # Deleting field 'LearnerWorkerTestOfferingPair.modified'
        db.delete_column('learnoffer_learnerworkertestofferingpair', 'modified')

        # Deleting field 'StoryTemplate.created'
        db.delete_column('learnoffer_storytemplate', 'created')

        # Deleting field 'StoryTemplate.modified'
        db.delete_column('learnoffer_storytemplate', 'modified')

        # Deleting field 'Association.created'
        db.delete_column('learnoffer_association', 'created')

        # Deleting field 'Association.modified'
        db.delete_column('learnoffer_association', 'modified')


    models = {
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'learnoffer.association': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Association'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'association_tags'", 'to': "orm['contenttypes.ContentType']"}),
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'object_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'associations'", 'to': "orm['learnoffer.AssociationTag']"})
        },
        'learnoffer.associationtag': {
            'Meta': {'object_name': 'AssociationTag'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'parent': ('mptt.fields.TreeForeignKey', [], {'blank': 'True', 'related_name': "'children'", 'null': 'True', 'to': "orm['learnoffer.AssociationTag']"}),
            'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'slug': ('django_extensions.db.fields.AutoSlugField', [], {'allow_duplicates': 'False', 'max_length': '50', 'separator': "u'-'", 'blank': 'True', 'populate_from': "'title'", 'overwrite': 'False', 'db_index': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        'learnoffer.learnerstory': {
            'Meta': {'object_name': 'LearnerStory', '_ormbases': ['learnoffer.Story']},
            'story_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['learnoffer.Story']", 'unique': 'True', 'primary_key': 'True'})
        },
        'learnoffer.learnerworkertest': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'LearnerWorkerTest'},
            'background_story': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'worker_tests'", 'to': "orm['learnoffer.LearnerStory']"}),
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'})
        },
        'learnoffer.learnerworkertestofferingpair': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'LearnerWorkerTestOfferingPair'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'other': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'other_worker_pairs'", 'to': "orm['learnoffer.OfferingStory']"}),
            'story': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'story_worker_pairs'", 'to': "orm['learnoffer.OfferingStory']"}),
            'test': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'pairs'", 'to': "orm['learnoffer.LearnerWorkerTest']"})
        },
        'learnoffer.offeringstory': {
            'Meta': {'object_name': 'OfferingStory', '_ormbases': ['learnoffer.Story']},
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'story_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['learnoffer.Story']", 'unique': 'True', 'primary_key': 'True'})
        },
        'learnoffer.story': {
            'Meta': {'object_name': 'Story'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'slug': ('django_extensions.db.fields.AutoSlugField', [], {'allow_duplicates': 'False', 'max_length': '50', 'separator': "u'-'", 'blank': 'True', 'populate_from': "'title'", 'overwrite': 'False', 'db_index': 'True'}),
            'template': ('django.db.models.fields.related.ForeignKey', [], {'blank': 'True', 'related_name': "'stories'", 'null': 'True', 'to': "orm['learnoffer.StoryTemplate']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'learnoffer.storytemplate': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'StoryTemplate'},
            'body': ('django.db.models.fields.TextField', [], {}),
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'root_tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'story_templates'", 'to': "orm['learnoffer.AssociationTag']"})
        }
    }

    complete_apps = ['learnoffer']
