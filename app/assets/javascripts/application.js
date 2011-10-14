//= require jquery
//= require jquery_ujs

$().ready(function(){
  $('.login-link').click(function(){
    $('#login-box').toggle("slow");
    $(this).toggleClass("open-box");
  })
});
