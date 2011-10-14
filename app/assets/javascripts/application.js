//= require jquery
//= require jquery_ujs

$().ready(function(){
  $('.login').click(function(){
    $('#login').toggle("slow");
    $(this).toggleClass("open-box");
  })
});
