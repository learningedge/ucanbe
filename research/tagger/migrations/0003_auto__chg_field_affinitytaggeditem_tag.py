# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Changing field 'AffinityTaggedItem.tag'
        db.alter_column('tagger_affinitytaggeditem', 'tag_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tagger.AffinityTag']))


    def backwards(self, orm):
        
        # Changing field 'AffinityTaggedItem.tag'
        db.alter_column('tagger_affinitytaggeditem', 'tag_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['taggit.Tag']))


    models = {
        'tagger.affinitytag': {
            'Meta': {'object_name': 'AffinityTag', '_ormbases': ['taggit.Tag']},
            'canonical': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'tag_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['taggit.Tag']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tagger.affinitytaggeditem': {
            'Meta': {'object_name': 'AffinityTaggedItem'},
            'content_object': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tagger.Item']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tagger.AffinityTag']"})
        },
        'tagger.item': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Item'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 34, 38, 757702)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 34, 38, 757825)', 'blank': 'True'}),
            'source_id': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'supplier': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'items'", 'to': "orm['tagger.Supplier']"})
        },
        'tagger.supplier': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Supplier'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 34, 38, 758346)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 34, 38, 758453)', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        },
        'taggit.tag': {
            'Meta': {'object_name': 'Tag'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '100', 'db_index': 'True'})
        }
    }

    complete_apps = ['tagger']
