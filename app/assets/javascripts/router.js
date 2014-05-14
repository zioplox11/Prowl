var MaincontainerViews = Backbone.Router.extend({

  initialize: function(){
    // this.collection = new Users();
  },

  routes: {
    "posts/community":    "show",
    "users/my_matches" :    "my_matches",
    "messages/my_messages" :    "my_messages",
    "posts/family" :    "show",
    "profile/my_profile" : "my_profile",
    "profile/:id" : "show"
  },

  index: function() {
      // this.usersView = new UsersView({collection: this.collection});
      // this.collection.fetch();
  },


  show: function(id) {
      // var user = this.collection.get(id);
  }

});
