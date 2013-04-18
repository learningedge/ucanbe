/*jslint adsafe:false */
/*global window:false, Backbone:false, console: false, ich: false, 
  _:false, $:false */

$(document).ready(function () {
    /* models */
    window.AffinityTag = Backbone.Model.extend({
        urlRoot: AFFINITY_TAG_API
    });

    window.Item = Backbone.Model.extend({
        urlRoot: ITEM_API
    });

    window.RequirementTag = Backbone.Model.extend({
        urlRoot: REQUIREMENT_TAG_API
    });

    /* collections */
    window.AffinityTagCollection = Backbone.Collection.extend({
        urlRoot: AFFINITY_TAG_API,
        model: window.AffinityTag
    });

    window.ItemCollection = Backbone.Collection.extend({
        urlRoot: ITEM_API,
        model: window.Item
    });

    window.RequirementTagCollection = Backbone.Collection.extend({
        urlRoot: REQUIREMENT_TAG_API,
        model: window.RequirementTag
    });

    /* model views */
    window.AffinityTagView = Backbone.View.extend({
        tagName: 'li',
        className: 'affinity-tag',

        template: _.template($('#affinity-tag-template').html()),
        
        initialize: function () {
            this.model.bind('change', this.render, this);
        },
        
        render: function () {
            var data = this.model.toJSON();
            $(this.el).html(this.template(data));
            return this;
        }
    });

    window.ItemView = Backbone.View.extend({
        tagName: 'li',
        className: 'item',

        template: _.template($('#item-template').html()),
        
        initialize: function () {
            this.model.bind('change', this.render, this);
        },
        
        render: function () {
            var data = this.model.toJSON();
            $(this.el).html(this.template(data));
            return this;
        }
    });

    window.RequirementTagView = Backbone.View.extend({
        tagName: 'li',
        className: 'requirement-tag',

        template: _.template($('#requirement-tag-template').html()),
        
        initialize: function () {
            this.model.bind('change', this.render, this);
        },
        
        render: function () {
            var data = this.model.toJSON();
            $(this.el).html(this.template(data));
            return this;
        }
    });

    /* collection views */
    window.AffinityTagListView = Backbone.View.extend({
        tagName: 'ul',
        className: 'affinity-tags',

        initialize: function () {
            this.model.bind('reset', this.render, this);
        },
        
        render: function (eventName) {
            var child;
            _.each(this.model.models, function (affinityTag) {
                child = (new window.AffinityTagView({
                    model: affinityTag
                })).render().el;
                $(this.el).append(child);
            }, this);
            return this;
        }
    });

    window.ItemListView = Backbone.View.extend({
        tagName: 'ul',
        className: 'items',

        initialize: function () {
            this.model.bind('reset', this.render, this);
        },
        
        render: function (eventName) {
            var child;
            _.each(this.model.models, function (item) {
                child = (new window.ItemView({
                    model: item
                })).render().el;
                $(this.el).append(child);
            }, this);
            return this;
        }
    });

    window.RequirementTagListView = Backbone.View.extend({
        tagName: 'ul',
        className: 'requirement-tags',

        initialize: function () {
            this.model.bind('reset', this.render, this);
        },
        
        render: function (eventName) {
            var child;
            _.each(this.model.models, function (requirementTag) {
                child = (new window.RequirementTagView({
                    model: requirementTag
                })).render().el;
                $(this.el).append(child);
            }, this);
            return this;
        }
    });

    /* router */
    window.AppRouter = Backbone.Router.extend({
        routes: {
            '': 'list'
        },

        list: function () {
            this.affinityTagList = new window.AffinityTagCollection();
            this.affinityTagListView = new window.AffinityTagListView({
                model: this.affinityTagList
            });
            this.itemList = new window.ItemCollection();
            this.itemListView = new window.ItemListView({
                model: this.itemList
            });
            this.requirementTagList = new window.RequirementTagCollection();
            this.requirementTagListView = new window.RequirementTagListView({
                model: this.requirementTagList
            });

            this.affinityTagList.fetch();
            this.itemList.fetch();
            this.requirementTagList.fetch();

            $("#objects").html(this.affinityTagListView.render().el);
            $("#objects").append(this.itemListView.render().el);
            $("#objects").append(this.requirementTagListView.render().el);
        }

    });    

    window.app = new window.AppRouter();
    Backbone.history.start();
});

