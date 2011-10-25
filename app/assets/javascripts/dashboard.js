//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require editable

$().ready(function(){
  $(".theme").change(sobre.addNewClass);

  $(".title").editable({
    'target'  : $("form.edit_page #page_title"),
    'message' : 'Edite seu título'
  });

  $(".subtitle").editable({
    'target'  : $("form.edit_page #page_subtitle"),
    'message' : 'Edite seu subtítulo'
  });

  $(".description").editable({
    'target'  : $("form.edit_page #page_description"),
    'message' : 'Edite sua descrição'
  });

  $(".phone").editable({
    'target'       : $("form.edit_page #page_phone"),
    'message'      : 'Edite seu telefone',
    'outerElement' : $('p.phone-layer')
  });

  $(".address").editable({
    'target'       : $("form.edit_page #page_address"),
    'message'      : 'Edite seu endereço',
    'outerElement' : $('.address-layer')
  });

  $(".email").editable({
    'target'       : $("form.edit_page #page_email"),
    'message'      : 'Edite seu endereço',
    'outerElement' : $('p.email-layer')
  });

  $(".twitter").editable({
    'target'  : $("form.edit_page #page_twitter")
  });

  $(".facebook").editable({
    'target'  : $("form.edit_page #page_facebook")
  });

  $(".linkedin").editable({
    'target'  : $("form.edit_page #page_linkedin")
  });

  $(".orkut").editable({
    'target'  : $("form.edit_page #page_orkut")
  });
});

var sobre = sobre || {};

sobre = {
  addNewClass: function() {
    $("body").removeClass().addClass("theme-" + $(this).val());
  }
}
