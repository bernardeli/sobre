;(function($){
  $.fn.editable = function(options) {
    var self = this;
    var message = options.message || "Click to edit";

    $(document).keyup(function(e) {
      if (e.keyCode == 27) { closeAllInputs() } // esc
    });

    self.live('click', function() { 
      closeAllInputs();
      options.value.toggle();
    });

    setInterval(function() { self.html(options.value.find(':input').val().replace(/\n/g, "<br />") || message) }, 1000);
  }

  function closeAllInputs() {
    $('.editable-box').each(function(){ $(this).hide() });
  };
})(jQuery);
