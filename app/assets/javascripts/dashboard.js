//= require jquery
//= require jquery_ujs
//= require jquery.autosave

$().ready(function(){
  $('form.edit_information').autosave({
    interval: 3000,
    monitor: 3000,
    save: function(e, o) {
      $("#save").show();
    }
  });

  setInterval(function() { $(".title").html($('form.edit_information #information_title').val()) }, 1000);
  setInterval(function() { $(".subtitle").html($('form.edit_information #information_subtitle').val()) }, 1000);
  setInterval(function() { $(".description").html($('form.edit_information #information_description').val()) }, 1000);
  setInterval(function() { sobre.interval("twitter") }, 1000);
  setInterval(function() { sobre.interval("facebook") }, 1000);
  setInterval(function() { sobre.interval("linkedin") }, 1000);
  setInterval(function() { sobre.interval("orkut") }, 1000);
});

var sobre = sobre || {};

sobre = {
  interval: function(field) {
    url = $("form.edit_information #information_" + field).val();
    fieldId = "." + field;
    $(fieldId).attr("href", url);
    if (url == "") {
      $(fieldId).hide();
    } else {
      $(fieldId).show();
    }
  },
}
