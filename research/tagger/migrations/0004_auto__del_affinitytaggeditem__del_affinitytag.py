# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Deleting model 'AffinityTaggedItem'
        db.delete_table('tagger_affinitytaggeditem')

        # Deleting model 'AffinityTag'
        db.delete_table('tagger_affinitytag')


    def backwards(self, orm):
        
        # Adding model 'AffinityTaggedItem'
        db.create_table('tagger_affinitytaggeditem', (
            ('content_object', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tagger.Item'])),
            ('tag', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tagger.AffinityTag'])),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
        ))
        db.send_create_signal('tagger', ['AffinityTaggedItem'])

        # Adding model 'AffinityTag'
        db.create_table('tagger_affinitytag', (
            ('tag_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['taggit.Tag'], unique=True, primary_key=True)),
            ('canonical', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('tagger', ['AffinityTag'])


    models = {
        'tagger.item': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Item'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 21, 12, 5, 164839)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 21, 12, 5, 164949)', 'blank': 'True'}),
            'source_id': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'supplier': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'items'", 'to': "orm['tagger.Supplier']"})
        },
        'tagger.supplier': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Supplier'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 21, 12, 5, 164298)', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 24, 21, 12, 5, 164429)', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['tagger']
