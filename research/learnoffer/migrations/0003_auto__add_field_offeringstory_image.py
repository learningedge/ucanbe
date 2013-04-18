# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'OfferingStory.image'
        db.add_column('learnoffer_offeringstory', 'image', self.gf('django.db.models.fields.files.ImageField')(default=1, max_length=100), keep_default=False)


    def backwards(self, orm):
        
        # Deleting field 'OfferingStory.image'
        db.delete_column('learnoffer_offeringstory', 'image')


    models = {
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'learnoffer.association': {
            'Meta': {'object_name': 'Association'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'association_tags'", 'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'object_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'associations'", 'to': "orm['learnoffer.AssociationTag']"})
        },
        'learnoffer.associationtag': {
            'Meta': {'object_name': 'AssociationTag'},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
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
        'learnoffer.offeringstory': {
            'Meta': {'object_name': 'OfferingStory', '_ormbases': ['learnoffer.Story']},
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'story_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['learnoffer.Story']", 'unique': 'True', 'primary_key': 'True'})
        },
        'learnoffer.story': {
            'Meta': {'object_name': 'Story'},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slug': ('django_extensions.db.fields.AutoSlugField', [], {'allow_duplicates': 'False', 'max_length': '50', 'separator': "u'-'", 'blank': 'True', 'populate_from': "'title'", 'overwrite': 'False', 'db_index': 'True'}),
            'template': ('django.db.models.fields.related.ForeignKey', [], {'blank': 'True', 'related_name': "'stories'", 'null': 'True', 'to': "orm['learnoffer.StoryTemplate']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'learnoffer.storytemplate': {
            'Meta': {'object_name': 'StoryTemplate'},
            'body': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['learnoffer']
