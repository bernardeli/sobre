//= require jquery
//= require jquery_ujs
//= require_tree .

$().ready(function(){
  $('.login-link').click(function(){
    $('#login-box').toggle("slow");
    $(this).toggleClass("open-box");
  })
});
