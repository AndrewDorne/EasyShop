$(document).ready(function() {
  var validator = $('#signUpForm').validate({
    rules: {
      username: {
        minlength: 2,
        required: true
      },
      fullname: {
        minlength: 2,
        required: true
      },
      email: {
        required: true, 
        email: true
      },
      password: {
        required: true,
        minlength: 5
      },
      passwordconfirm: {
        required: true,
        minlength: 5,
        equalTo: "#password"
      }
    },
    highlight: function(e) {
      $(e).closest('.control-group').removeClass('success').addClass('error');
    },
    success: function(e) {
      e
        .text('OK!').addClass('valid')
        .closest('.control-group').removeClass('error').addClass('success');
    }
  });

  $('#loginForm').submit(function() {
    
  });

  $("#signUp").on("hidden", function() { 
    $(".modal-body").find('form')[0].reset();
    $(".control-group").removeClass('error').removeClass('success');
    validator.resetForm() 
  });
});
