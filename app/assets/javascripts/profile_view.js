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
      "click .change_profile_button" : "renderEditView",
      "change input"          : "changed",
      "change select"           : "changed",
    },

    editTemplate: _.template($("#edit_own_profile").html()),

    viewOwnTemplate: _.template($("#view_own_profile").html()),

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


  var User = Backbone.Model.extend({
    urlRoot: '/users'
  })

 MiniProfileList = Backbone.Collection.extend({
    url: '/users/localprofiles',
    model: User
  });

 var miniProfileObj;


MiniProfilesView = Backbone.View.extend({

    el: $('#mini_profile'),

    initialize: function(){
        this.renderProfilesView();
        this.collection.fetch();
    },

    events: {
      "click .mini-profile-container" : "renderFullProfile",
      "click .return_to_mini_profiles" : "renderProfilesView"
    },

    viewLocalProfiles: _.template(JST['templates/mini_profile_view']),

    viewAnotherProfile: _.template($("#view_another_profile").html()),

    renderProfilesView: function(){
      this.$el.empty();
      var that = this;
      this.collection.each(function(miniProfile,idx){
        var miniProfile = that.renderPerson(miniProfile);
      }.bind(this));
    },

    renderPerson: function(miniProfile){

        miniProfileObj = {
          user_id: miniProfile.get('id'),
          username: miniProfile.get('username'),
          profile_image_url: miniProfile.get('profile_image_url'),
          borough: miniProfile.get('borough'),
          age: miniProfile.get('age'),
          looking_for: miniProfile.get('looking_for'),
          created_at: miniProfile.get('created_at')
        }
        this.$el.append(this.viewLocalProfiles(miniProfileObj));
    },

    renderFullProfile: function(e) {
      var that = this;
      var thisid = arguments[0].currentTarget.id;
      var thisProfile = new User({id: thisid});
      debugger;
      thisProfile.fetch().complete(function(){
        that.$viewEl = $("<div>").html(that.viewAnotherProfile(thisProfile.toJSON()));
        that.$el.empty();
        that.$el.append(that.$viewEl);
      });
    }


});





});


