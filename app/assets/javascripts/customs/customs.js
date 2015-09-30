
//= require customs/users_center.coffee
//= require customs/organizations.coffee.js
//= require customs/users_sign_in
//= require customs/jquery-file-upload

jQuery.validator.setDefaults({
  debug: true,
  errorElement: 'span', //default input error message container
  errorClass: 'help-block help-block-error', // default input error message class
  focusInvalid: false, // do not focus the last invalid input
  ignore: "",  // validate all fields including form hidden input
  invalidHandler: function (event, validator) { //display error alert on form submit
    var form = validator.currentForm;
    var error = $('.alert-danger', form);
    var success = $('.alert-success', form);
    success.hide();
    error.show();
    Metronic.scrollTo(error, -200);
  },

  errorPlacement: function (error, element) { // render error placement for each input type
    if (element.parent(".input-group").size() > 0) {
      error.insertAfter(element.parent(".input-group"));
    } else if (element.attr("data-error-container")) {
      error.appendTo(element.attr("data-error-container"));
    } else if (element.parents('.radio-list').size() > 0) {
      error.appendTo(element.parents('.radio-list').attr("data-error-container"));
    } else if (element.parents('.radio-inline').size() > 0) {
      error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
    } else if (element.parents('.checkbox-list').size() > 0) {
      error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
    } else if (element.parents('.checkbox-inline').size() > 0) {
      error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
    } else {
      error.insertAfter(element); //  for other inputs, just perform default behavior
    }
  },

  highlight: function (element) { // hightlight error inputs
    $(element)
      .closest('.form-group').removeClass("has-success").addClass('has-error'); // set error class to the control group
  },

  unhighlight: function (element) { // revert the change done by hightlight
  },

  success: function (label, element) {
    $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
  },

  submitHandler: function (form) {
    var error = $('.alert-danger', form);
    var success = $('.alert-success', form);
    success.show();
    error.hide();
    form.submit(); // submit the form
  }
});

