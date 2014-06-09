// var ProfileView, profileView;

$(function(){

  ProfileView = Backbone.View.extend({
    // model :User,

    el: $('#main_profile'),

    initialize: function(){
        console.log("new")
        this.renderEditView();
        this.renderOwnProfileView();
        // this.listenTo(this.model, "change", this.renderOwnProfileView);
    },

    events: {
      "click .update_profile" : "updateProfile",
      // "click .switch_profile" : "updateProfile",
      "click .change_profile_button" : "renderEditView",
      "change input"          : "changed",
      "change select"           : "changed"
    },

    editTemplate: _.template($("#edit_own_profile").html()),

    viewOwnTemplate: _.template($("#view_own_profile").html()),

    viewAnotherTemplate: _.template($("#view_another_profile").html()),

    viewLocalProfiles: _.template($("#view__local_profiles").html()),

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

    renderMiniProfileView: function(){
      this.$viewEl = $("<div>").html(this.viewLocalProfiles(this.model.toJSON()));
      this.$el.empty();
      this.$el.append(this.$viewEl);
    },

    changed: function(event){
      var changed = event.currentTarget;
      var value = $(event.currentTarget).val();
      this.model.set(changed.id, value);
    },

    updateProfile: function(){
      this.model.save().complete(function(){
        profileView.renderOwnProfileView();
      });
    }

  });


 MiniProfileList = Backbone.Collection.extend({
    url: '/users',
    model: ProfileView
  });



});


