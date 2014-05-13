var LogInView, logInView;

$(document).ready(function(){

  LogInView = Backbone.View.extend({

    el: $('#main_view'),

    initialize: function(){
        this.renderProfile();
        // this.listenTo(this.model, "add", this.refreshProfile);
    },

    template: _.template($("#current_user_profile").html()),

    events: {
      'click .view_profile' : 'refreshProfile'
    },

    renderProfile: function(){
      var pr = $('<div id="my_profile">');
      pr.html(this.template(this.model.toJSON()));
      this.$el.append(pr);
    }

    // refreshProfile: function(){
    //    var pr = $('<div id="my_profile">');
    //   pr.html(this.template(this.model.attributes));
    //   this.$el.append(pr);
    //   return this;
    // }


  });
});


