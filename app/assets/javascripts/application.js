//= require jquery
//= require jquery_ujs
//= require jquery.validate.min

$().ready(function(){
  $('.login-link').click(function(){
    $('#login-box').toggle("slow");
    $(this).toggleClass("open-box");
  });

  $("#user_new").validate();
  $(".contact-page form").validate();
});
