function helloWorld() {
    return "Hello world!";
}

function helloLesbianWorld() {
    return "Hello Lesbians!";
}


$(function(){

  console.log(helloLesbianWorld());

  var mainView = $("#main_view").html('<p>TESTING IT OUT!</p>');

  var testContent = $('<p>').html(helloLesbianWorld());

  mainView.append(testContent);

  var addingContent = $("#main_view");

  var signUp = $("<div id='login_signup'><input type='text' placeholder='Enter Name Here' class='textSignUp'></br><input type='text' placeholder='Enter Password Here' class='textPassword'><button class='passwordButton'>Sign Up Now!</button></br></div>");

  var peopleOnline =   $("<div id='local_users'>");

  var someoneOnline = $('<div class="local_user"><p>A local user</p><p>Name: Barbara</p><p>Age: 33</div>');

  var someoneElseOnline = $('<div class="local_user"><p>A local user</p><p>Name: Sam</p><p>Age: 23</div>');

  var someoneElseOnline1 = $('<div class="local_user"><p>A local user</p><p>Name: Lauryn</p><p>Age: 26</div>');

  peopleOnline.append(someoneOnline);

  addingContent.append(signUp);

  addingContent.append(peopleOnline);

  peopleOnline.append(someoneElseOnline);

  peopleOnline.append(someoneElseOnline1);


});
