# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("#edit_port_btn").click(function() {

  var container = $("#info");
  $("#edit_port_form").submit(function() {
    $(this).unbind('submit').ajaxSubmit({
      success: function(data) {
        container.html(data);
        hudMsg('success', 'Modify ports successfully.');
      }
    })
  });
});
