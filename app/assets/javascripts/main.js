var app = {

  init: function(){
    Backbone.history.start();

  }

}


$(document).ready(function(){
  router = new Router();
  Backbone.history.start();
});



$(function(){

  // var mainView = $("#main_view").html('<p id="tester">Main View!</p>');

  // var addingContent = $("#main_view");

  var mainSplashView = $('#main_splash_view');


  var signUp = $("<div id='signup_form'><p>Welcome to Prowl! The best place to mix and mingle with local lesbians ... and those around the world!</p><input type='text' placeholder='Enter Name Here' class='name_signup'></br><input type='text' placeholder='Enter Email Here' class='email_signup'></br><input type='password' placeholder='Enter Password Here' class='enter_password'></br><input type='password' placeholder='Confirm Password Here' class='confirm_password'></br><button class='submit_button'>Sign Up Now!</button></br></div>");

  mainSplashView.append(signUp);

  // var peopleOnline =   $("<div id='local_users'>");

  // var someoneOnline = $('<div class="local_user"><p>A local user</p><p>Name: Barbara</p><p>Age: 33</div>');

  // var someoneElseOnline = $('<div class="local_user"><p>A local user</p><p>Name: Sam</p><p>Age: 23</div>');

  // var someoneElseOnline1 = $('<div class="local_user"><p>A local user</p><p>Name: Lauryn</p><p>Age: 26</div>');

  // peopleOnline.append(someoneOnline);

  // addingContent.append(peopleOnline);

  // peopleOnline.append(someoneElseOnline);

  // peopleOnline.append(someoneElseOnline1);

  // user = new User();

  signUpView = new SignUpView();
});
