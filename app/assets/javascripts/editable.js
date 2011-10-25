;(function($){
  $.fn.editable = function(options) {
    var self = this;
    var message = options.message || "Click to edit";
    var outerElement = options.outerElement || this;

    $(document).keyup(function(e) {
      if (e.keyCode == 27) { closeAllInputs() } // esc
    });

    self.click(function() { 
      closeAllInputs();
      options.target.toggle();
    });

    outerElement.show();
    setInterval(function() { self.html(options.target.val().replace(/\n/g, "<br />") || message) }, 1000);
  }

  function closeAllInputs() {
    $(':input[id*="page_"]').each(function(){ $(this).hide(); });
  };
})(jQuery);
