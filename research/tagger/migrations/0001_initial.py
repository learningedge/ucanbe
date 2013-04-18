# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Supplier'
        db.create_table('tagger_supplier', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=256)),
        ))
        db.send_create_signal('tagger', ['Supplier'])

        # Adding model 'Item'
        db.create_table('tagger_item', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
            ('source_id', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('supplier', self.gf('django.db.models.fields.related.ForeignKey')(related_name='items', to=orm['tagger.Supplier'])),
        ))
        db.send_create_signal('tagger', ['Item'])

    def backwards(self, orm):
        # Deleting model 'Supplier'
        db.delete_table('tagger_supplier')

        # Deleting model 'Item'
        db.delete_table('tagger_item')

    models = {
        'tagger.item': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Item'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'source_id': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'supplier': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'items'", 'to': "orm['tagger.Supplier']"})
        },
        'tagger.supplier': {
            'Meta': {'ordering': "('-modified', '-created')", 'object_name': 'Supplier'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        }
    }

    complete_apps = ['tagger']