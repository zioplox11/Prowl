$(function(){
  new AppRouter();
  Backbone.history.start();
});

var Message, MessagesView, MessageList, inbox, inboxView;
var User, user, currentUser;
var ProfileView, profileView, MiniProfileList, miniProfileList, miniProfile, miniProfiles, miniProfilesView;
var router;



var AppRouter = Backbone.Router.extend({

  initialize: function(){
    router = this;
    inbox = new MessageList();
    inboxView = new MessagesView({collection: inbox});
    miniProfileList = new MiniProfileList();
    miniProfilesView = new MiniProfilesView({collection: miniProfileList});
  },

  routes: {
    "viewMyProfile"              : "viewMyProfile",
    "viewMyMatches"              : "viewMyMatches",
    "viewMyMessages"             : "viewMyMessages",
    "localProfiles"   : "localProfiles",
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
    router = this;
    $('#main_view').empty;
    inbox.fetch().complete(function(){
      inboxView.render();
      router.showNewView(inboxView);
    });
  },

  viewMyProfile: function(id) {
    router = this;
    $('#main_view').empty;
    currentUser.fetch().complete(function(){
      router.showNewView(profileView);
    });
  },

  communityBulletin: function(borough) {

  },

  viewMyMatches: function(id) {

  },

  familyKidsForum: function(borough) {

  },

  localProfiles: function(lat, long) {
    router = this;
    $('#main_view').empty;
    miniProfileList.fetch().complete(function(){
      miniProfilesView.renderProfilesView();
      router.showNewView(miniProfilesView);
    });
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
