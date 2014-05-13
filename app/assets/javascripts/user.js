var User, user, currentUser;

User = Backbone.Model.extend({
  urlRoot: '/users',

  defaults: {
    age: null
  }
});



