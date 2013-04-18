# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'RequirementTaggedItem.level'
        db.add_column('tagger_requirementtaggeditem', 'level', self.gf('django.db.models.fields.IntegerField')(default=0), keep_default=False)

        # Deleting field 'RequirementTag.level'
        db.delete_column('tagger_requirementtag', 'level')


    def backwards(self, orm):
        
        # Deleting field 'RequirementTaggedItem.level'
        db.delete_column('tagger_requirementtaggeditem', 'level')

        # Adding field 'RequirementTag.level'
        db.add_column('tagger_requirementtag', 'level', self.gf('django.db.models.fields.IntegerField')(default=0), keep_default=False)


    models = {
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'tagger.affinitytag': {
            'Meta': {'object_name': 'AffinityTag'},
            'canonical': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '100', 'db_index': 'True'})
        },
        'tagger.affinitytaggeditem': {
            'Meta': {'object_name': 'AffinityTaggedItem'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'tagger_affinitytaggeditem_tagged_items'", 'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'object_id': ('django.db.models.fields.IntegerField', [], {'db_index': 'True'}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'affinity_tagged_items'", 'to': "orm['tagger.AffinityTag']"})
        },
        'tagger.item': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Item'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 5, 8, 1, 36, 19, 23305)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 5, 8, 1, 36, 19, 23390)', 'blank': 'True'}),
            'source_id': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'supplier': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'items'", 'to': "orm['tagger.Supplier']"})
        },
        'tagger.requirementtag': {
            'Meta': {'object_name': 'RequirementTag'},
            'canonical': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '100', 'db_index': 'True'})
        },
        'tagger.requirementtaggeditem': {
            'Meta': {'object_name': 'RequirementTaggedItem'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'tagger_requirementtaggeditem_tagged_items'", 'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'level': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'object_id': ('django.db.models.fields.IntegerField', [], {'db_index': 'True'}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'requirement_tagged_items'", 'to': "orm['tagger.RequirementTag']"})
        },
        'tagger.supplier': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Supplier'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 5, 8, 1, 36, 19, 22921)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 5, 8, 1, 36, 19, 23015)', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['tagger']
