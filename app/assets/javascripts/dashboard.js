//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require easyTooltip
//= require editable

$().ready(function(){
  $(".tooltip").easyTooltip({
    xOffset: -66,
    yOffset: 60
  });

  $(".theme").change(sobre.addNewClass);

  $(".title").editable({
    'value'   : $(".title-input"),
    'message' : 'Edite seu título'
  });

  $(".subtitle").editable({
    'value'  : $(".subtitle-input"),
    'message' : 'Edite seu subtítulo'
  });

  $(".description").editable({
    'value'  : $(".description-input"),
    'message' : 'Edite sua descrição'
  });

  $(".phone").editable({
    'value'       : $(".phone-input"),
    'message'      : 'Edite seu telefone',
    'outerElement' : $('p.phone-layer')
  });

  $(".address").editable({
    'value'       : $(".address-input"),
    'message'      : 'Edite seu endereço',
    'outerElement' : $('.address-layer')
  });

  $(".email").editable({
    'value'       : $(".email-input"),
    'message'      : 'Edite seu endereço',
    'outerElement' : $('p.email-layer')
  });

  $(".twitter").editable({
    'value'  : $(".twitter-input")
  });

  $(".facebook").editable({
    'value'  : $(".facebook-input")
  });

  $(".linkedin").editable({
    'value'  : $(".linkedin-input")
  });

  $(".orkut").editable({
    'value'  : $(".orkut-input")
  });
});

var sobre = sobre || {};

sobre = {
  addNewClass: function() {
    $("body").removeClass().addClass("theme-" + $(this).val());
  }
}
