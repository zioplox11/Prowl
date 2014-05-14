// var SignUpView, signUpView;

// SignUpView = Backbone.View.extend({
//   el: '#main_splash_view',

//   initialize: function(){
//     this.form = this.$el.find('#signup_form');
//     this.usernameField = this.$el.find('.name_signup');
//     this.emailField = this.$el.find('.email_signup');
//     this.passwordField = this.$el.find('.enter_password');
//     this.passwordConfirmationField = this.$el.find('.confirm_password');
//     this.submitButton = this.$el.find('.submit_button');
//   },

//   events: {
//     'click .submit_button' : 'createUser'
//   },

//   attributes: function(){
//     return {
//       username: this.usernameField.val(),
//       email: this.emailField.val(),
//       password: this.passwordField.val(),
//       password_confirmation: this.passwordConfirmationField.val()
//     }
//   },

//   createUser: function(){
//     user = new User(this.attributes());
//     user.save();
//   }

// });


