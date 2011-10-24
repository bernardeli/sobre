//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.autosave

$().ready(function(){
  $(".trigger-form").click(sobre.togglePageForm);
  $(".close-form").click(sobre.togglePageForm);
  $(".theme").change(sobre.addNewClass);

  $('form.edit_page').autosave({
    interval: 3000,
    monitor: 3000,
    save: function(e, o) {
      $(".save").show();
      setInterval(function() { $(".save").hide() }, 2500);
    }
  });

  $("#page-form").draggable();

  setInterval(function() { $(".title").html($('form.edit_page #page_title').val() || "Edite seu título") }, 1000);
  setInterval(function() { $(".subtitle").html($('form.edit_page #page_subtitle').val() || "Edite seu subtítulo") }, 1000);
  setInterval(function() { $(".description").html($('form.edit_page #page_description').val().replace(/\n/g, "<br />") || "Edite sua descrição") }, 1000);
  setInterval(function() { sobre.layer("phone", "Edite seu telefone") }, 1000);
  setInterval(function() { sobre.layer("address", "Edite seu endereço") }, 1000);
  setInterval(function() { sobre.layer("email", "Edite seu email") }, 1000);
  setInterval(function() { sobre.interval("twitter", "http://twitter.com/") }, 1000);
  setInterval(function() { sobre.interval("facebook", "http://facebook.com/") }, 1000);
  setInterval(function() { sobre.interval("linkedin", "http://linkedin.com/in/") }, 1000);
  setInterval(function() { sobre.interval("orkut", "http://orkut.com/") }, 1000);
});

var sobre = sobre || {};

sobre = {
  layer: function(field, msg) {
    val = $('form.edit_page #page_' + field).val();

    //if (val == "") {
      //$("." + field + "-layer").hide();
    //} else {
      $("." + field + "-layer").show();
    //}

    $("." + field).html(val || msg);
  },

  interval: function(field, urlBase) {
    username = $("form.edit_page #page_" + field).val();
    url = urlBase + username
    fieldId = "." + field;
    $(fieldId).attr("href", url);
    $(fieldId).show();
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
