var membershipFormValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var membershipForm = $('#new_membership');

  membershipForm.validate({
    rules: {
      "membership[desc]": {
        minlength: 2,
        required: true
      }

    },
    messages: {
      "membership[desc]": {
        minlength: "至少为2个字",
        required: "请填写申请的相关信息"
      }
    }

  });

};
$(function(){
  membershipFormValidate();
});



