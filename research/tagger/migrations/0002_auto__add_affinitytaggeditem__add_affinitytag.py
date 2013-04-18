# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'AffinityTaggedItem'
        db.create_table('tagger_affinitytaggeditem', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('tag', self.gf('django.db.models.fields.related.ForeignKey')(related_name='tagger_affinitytaggeditem_items', to=orm['taggit.Tag'])),
            ('content_object', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tagger.Item'])),
        ))
        db.send_create_signal('tagger', ['AffinityTaggedItem'])

        # Adding model 'AffinityTag'
        db.create_table('tagger_affinitytag', (
            ('tag_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['taggit.Tag'], unique=True, primary_key=True)),
            ('canonical', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('tagger', ['AffinityTag'])


    def backwards(self, orm):
        
        # Deleting model 'AffinityTaggedItem'
        db.delete_table('tagger_affinitytaggeditem')

        # Deleting model 'AffinityTag'
        db.delete_table('tagger_affinitytag')


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
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'tagger_affinitytaggeditem_items'", 'to': "orm['taggit.Tag']"})
        },
        'tagger.item': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Item'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 23, 53, 949812)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 23, 53, 949932)', 'blank': 'True'}),
            'source_id': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'supplier': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'items'", 'to': "orm['tagger.Supplier']"})
        },
        'tagger.supplier': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Supplier'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 23, 53, 949297)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 19, 23, 53, 949422)', 'blank': 'True'}),
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
