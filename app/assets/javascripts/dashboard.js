//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.maskedinput
//= require jquery.autosave

$().ready(function(){
  $(".trigger-form").click(sobre.toggleInformationForm);
  $(".close-form").click(sobre.toggleInformationForm);

  $('form.edit_information').autosave({
    interval: 3000,
    monitor: 3000,
    save: function(e, o) {
      $(".save").show('slow');
      setInterval(function() { $(".save").hide('slow') }, 2500);
    }
  });

  $("#information-form").draggable();
  $("#information_phone").mask("(99) 9999-9999");

  setInterval(function() { $(".title").html($('form.edit_information #information_title').val()) }, 1000);
  setInterval(function() { $(".subtitle").html($('form.edit_information #information_subtitle').val()) }, 1000);
  setInterval(function() { $(".description").html($('form.edit_information #information_description').val()) }, 1000);
  setInterval(function() { $(".phone").html($('form.edit_information #information_phone').val()) }, 1000);
  setInterval(function() { $(".address").html($('form.edit_information #information_address').val()) }, 1000);
  setInterval(function() { $(".email").html($('form.edit_information #information_email').val()) }, 1000);
  setInterval(function() { sobre.interval("twitter", "http://twitter.com/") }, 1000);
  setInterval(function() { sobre.interval("facebook", "http://facebook.com/") }, 1000);
  setInterval(function() { sobre.interval("linkedin", "http://linkedin.com/in/") }, 1000);
  setInterval(function() { sobre.interval("orkut", "http://orkut.com/") }, 1000);
});

var sobre = sobre || {};

sobre = {
  interval: function(field, urlBase) {
    username = $("form.edit_information #information_" + field).val();
    url = urlBase + username
    fieldId = "." + field;
    $(fieldId).attr("href", url);
    if (username == "") {
      $(fieldId).hide();
    } else {
      $(fieldId).show();
    }
  },

  toggleInformationForm: function() {
    $("#information-form").toggle("fast");
    $(".trigger-form").toggle("fast");
    return false;
  }
}
