var ProfileView, profileView;

$(function(){

  ProfileView = Backbone.View.extend({

    el: $('#main_profile'),

    initialize: function(){
        this.renderOwnProfileView();
        // this.listenTo(this.model, "change", this.renderOwnProfileView);
    },

    events: {
      "click .update_profile" : "updateProfile",
      "change input" : "updateProfile",
      "click .switch_profile" : "updateProfile",
      "click .change_profile" : "renderEditView",
    },

    editTemplate: _.template($("#edit_own_profile").html()),

    viewOwnTemplate: _.template($("#view_own_profile").html()),

    viewAnotherTemplate: _.template($("#view_another_profile").html()),

    renderEditView: function(){
      this.$formEl = $("<div>").html(this.editTemplate(this.model.toJSON()));
      this.$el.empty();
      this.$el.append(this.$formEl);
    },

    renderOwnProfileView: function(){
      this.$viewEl = $("<div>").html(this.viewOwnTemplate(this.model.toJSON()));
      this.$el.empty();
      this.$el.append(this.$viewEl);
    },

    renderOtherProfileView: function(){
      this.$viewEl = $("<div>").html(this.viewAnotherTemplate(this.model.toJSON()));
      this.$el.empty();
      this.$el.append(this.$viewEl);
    },

    updateProfile: function(event){
      // event.preventDefault();
      var changed = event.currentTarget;
      var value = $(event.currentTarget).val();
      var view = this;
      this.model.save(changed.id, value).complete(function(){
        view.renderOwnProfileView();
      });
    }

  });
});


