var organizationsUsersFormValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var organizationsUsersForm = $('#new_organizations_user');

  organizationsUsersForm.validate({
    rules: {
      "organizations_user[desc]": {
        minlength: 2,
        required: true
      }

    },
    messages: {
      "organizations_user[desc]": {
        minlength: "至少为2个字",
        required: "请填写申请的相关信息"
      }
    }

  });

};
$(function(){
  organizationsUsersFormValidate();
});



