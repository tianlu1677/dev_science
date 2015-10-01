var organizationFormValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var organizationForm = $('#organization_form');

  organizationForm.validate({
    rules: {
      "organization[name]": {
        minlength: 2,
        required: true
      },
      "organization[city]": {
        required: true
      }
    },
    messages: {
      "organization[name]": {
        minlength: "机构的名称至少为2个字",
        required: "请填写机构的名称"
      },
      "organization[city]": {
        required: "请填写机构所在城市"
      }
    }

  });

};
$(function(){
  organizationFormValidate();
});



