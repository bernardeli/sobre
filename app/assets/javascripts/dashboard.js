//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.maskedinput
//= require jquery.autosave

$().ready(function(){
  $(".trigger-form").click(sobre.togglePageForm);
  $(".close-form").click(sobre.togglePageForm);
  $(".theme").change(sobre.addNewClass);

  $('form.edit_page').autosave({
    interval: 3000,
    monitor: 3000,
    save: function(e, o) {
      $(".save").show('slow');
      setInterval(function() { $(".save").hide('slow') }, 2500);
    }
  });

  $("#page-form").draggable();
  $("#page_phone").mask("(99) 9999-9999");

  setInterval(function() { $(".title").html($('form.edit_page #page_title').val()) }, 1000);
  setInterval(function() { $(".subtitle").html($('form.edit_page #page_subtitle').val()) }, 1000);
  setInterval(function() { $(".description").html($('form.edit_page #page_description').val()) }, 1000);
  setInterval(function() { sobre.layer("phone") }, 1000);
  setInterval(function() { sobre.layer("address") }, 1000);
  setInterval(function() { sobre.layer("email") }, 1000);
  setInterval(function() { sobre.interval("twitter", "http://twitter.com/") }, 1000);
  setInterval(function() { sobre.interval("facebook", "http://facebook.com/") }, 1000);
  setInterval(function() { sobre.interval("linkedin", "http://linkedin.com/in/") }, 1000);
  setInterval(function() { sobre.interval("orkut", "http://orkut.com/") }, 1000);
});

var sobre = sobre || {};

sobre = {
  layer: function(field) {
    val = $('form.edit_page #page_' + field).val();

    if (val == "") {
      $("." + field + "-layer").hide();
    } else {
      $("." + field + "-layer").show();
    }

    $("." + field).html(val);
  },

  interval: function(field, urlBase) {
    username = $("form.edit_page #page_" + field).val();
    url = urlBase + username
    fieldId = "." + field;
    $(fieldId).attr("href", url);
    if (username == "") {
      $(fieldId).hide();
    } else {
      $(fieldId).show();
    }
  },

  togglePageForm: function() {
    $("#page-form").toggle("fast");
    $(".trigger-form").toggle("fast");
    return false;
  },

  addNewClass: function() {
    $("body").removeClass().addClass("theme-" + $(this).val());
  }
}
