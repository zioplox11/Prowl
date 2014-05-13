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
    pr.html(this.profileAttributes());
    this.$el.append(pr);
  },

  refreshProfile: function(){
     var pr = $('<div id="my_profile">');
    pr.html(this.profileAttributes());
    this.$el.append(pr);
  },

  profileAttributes: function(){
    return this.model.get("username");
    // this.model.get("gender");
    // this.model.get("age");
    // this.model.get("height");
    // this.model.get("body_type");
    // this.model.get("birthdate");
    // this.model.get("email");
    // this.model.get("ethnicity");
    // this.model.get("diet");
    // this.model.get("drugs");
    // this.model.get("drinks");
    // this.model.get("smokes");
    // this.model.get("zodiac_sign");
    // this.model.get("education");
    // this.model.get("job");
    // this.model.get("income");
    // this.model.get("relationship_status");
    // this.model.get("relationship_type");
    // this.model.get("children_family");
    // this.model.get("languages");
    // this.model.get("pets");
    // this.model.get("self_summary");
    // this.model.get("looking_for");
    // this.model.get("created_at");
    // this.model.get("updated_at");
  }

});



