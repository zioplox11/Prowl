var LogInView, logInView;

$(document).ready(function(){

  LogInView = Backbone.View.extend({

    el: $('#my_profile'),

    initialize: function(){
        this.render();
        this.listenTo(this.model, "change", this.renderProfileView);
    },

    events: {
      "click button": "updateProfile",
      "change input": "changed"
    },

    editTemplate: _.template($("#edit_profile").html()),

    viewTemplate: _.template($("#view_profile").html()),

    render: function(){
      this.$formEl = $("<div>").html(this.editTemplate(this.model.toJSON()));
      this.$viewEl = $("<div>").html(this.viewTemplate(this.model.toJSON()));

      this.$el.empty();
      this.$el.append(this.$formEl);
      this.$el.append(this.$viewEl);
    },

    renderProfileView: function(){
        this.$viewEl.html(this.viewTemplate(this.model.toJSON()));
    },

    updateProfile: function(event){
      event.preventDefault();
      console.log("yo");
      this.model.save();
    },

    changed: function(event){
      console.log(event);
      var changed = event.currentTarget;
      console.log(changed);
      var value = $(event.currentTarget).val();
      console.log(value);
      this.model.set(changed.id, value);
    }

  });
});


