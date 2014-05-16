$(function(){
  new AppRouter();
  Backbone.history.start();
});

var Message, MessagesView, MessageList, inbox, inboxView;
var User, user, currentUser;
var ProfileView, profileView;
var router;

var AppRouter = Backbone.Router.extend({

  initialize: function(){
    router = this;
    inbox = new MessageList();
    inboxView = new MessagesView({collection: inbox});
  },

  routes: {
    "viewMyProfile"              : "viewMyProfile",
    "viewMyMatches"              : "viewMyMatches",
    "viewMyMessages"             : "viewMyMessages",
    "localProfiles/:lat/:long"   : "localProfiles",
    "familyKidsForum/:borough"   : "familyKidsForum",
    "communityBulletin/:borough" : "communityBulletin"
    // "community_bulletin/:borough"    :       "communityBulletin",
    // "my_matches/:id"                 :       "viewMyMatches",
    // "my_messages/:id"                :       "viewMyMessages",
    // "family_and_kids_forum/:borough" :       "familyKidsForum",
    // "my_profile/:id"                 :       "viewMyProfile",
    // "browse_profiles_near_me/:latitude/:longitude" : "localProfiles",
    // "search_for_a_profile/:username" :       "profileSearch",
    // "my_account_details/:id"         :       "myAccountDetails",
    // "view_full_profile/:id"          :       "viewFullProfile"
  },

  showNewView: function(newView){
    $('#main_view').children().hide()
    newView.$el.show();
  },

  viewMyMessages: function(id) {
    inbox.fetch().complete(function(){
      inboxView.render();
      router.showNewView(inboxView);
    });
  },

  viewMyProfile: function(id) {
    var router = this;
    currentUser.fetch().complete(function(){
      router.showNewView(profileView)
    });
  },

  communityBulletin: function(borough) {

  },

  viewMyMatches: function(id) {

  },

  familyKidsForum: function(borough) {

  },

  localProfiles: function(lat, long) {

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
