$(document).ready(function(){
  $('form.edit_information').autosave({
    interval: 5000,
    monitor: 3000,
    save: function(e, o) {
      $("#save").show();
    }
  })
});
