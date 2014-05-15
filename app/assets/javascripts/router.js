$(function(){



var MaincontainerViews = Backbone.Router.extend({

  initialize: function(){
    // this.collection = new Users();
  },

  routes: {
    "community_bulletin/:borough"    :       "communityBulletin",
    "my_matches/:id"                 :       "viewMyMatches",
    "my_messages/:id"                :       "viewMyMessages",
    "family_and_kids_forum/:borough" :       "familyKidsForum",
    "my_profile/:id"                 :       "viewMyProfile",
    "browse_profiles_near_me/:latitude/:longitude" : "localProfiles",
    "search_for_a_profile/:username" :       "profileSearch",
    "my_account_details/:id"         :       "myAccountDetails",
    "view_full_profile/:id"          :       "viewFullProfile"
  },

  communityBulletin: function(borough) {

  },

  viewMyMatches: function(id) {

  },

  viewMyMessages: function(id) {

  },

  familyKidsForum: function(borough) {

  },

  viewMyProfile: function(id) {

  },

  localProfiles: function(latitude, longitude) {

  },

  profileSearch: function(username) {

  },

  myAccountDetails: function(id) {

  },

  viewFullProfile: function(id) {

  },


  index: function() {
      // this.usersView = new UsersView({collection: this.collection});
      // this.collection.fetch();
  },


  show: function(id) {
      // var user = this.collection.get(id);
  }

});


});
