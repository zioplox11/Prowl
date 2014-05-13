var LogInView, logInView;

LogInView = Backbone.View.extend({

  el: '#main_view',

  initialize: function(){
      this.renderProfile();
  },

  events: {
    'click .view_profile' : 'refreshProfile'
  },

  renderProfile: function(){
    var pr = $('<div id="my_profile">');
    pr.html(this.model.get("username"));
    this.$el.append(pr);
  },

  refreshProfile: function(){
     var pr = $('<div id="my_profile">');
    pr.html(this.model.get("username"));
    this.$el.append(pr);
  }

});



