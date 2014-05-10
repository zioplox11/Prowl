function helloWorld() {
    return "Hello world!";
}

function helloLesbianWorld() {
    return "Hello Lesbians!";
}


$(function(){

  console.log(helloLesbianWorld());

  var firstPost = $("#localLesbians").html('<p>TESTING IT OUT!</p>');

  var content = $('<p>').html(helloLesbianWorld());

  firstPost.append(content);

});
