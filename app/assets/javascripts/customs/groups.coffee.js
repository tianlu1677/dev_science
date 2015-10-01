var groupFormValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var groupForm = $('#group_form');

  groupForm.validate({
    rules: {
      "group[name]": {
        minlength: 2,
        required: true
      },
      "group[short_name]": {
        required: true
      }
    },
    messages: {
      "group[name]": {
        minlength: "群组的名称至少为2个字",
        required: "请填写群组的名称"
      },
      "group[short_name]": {
        required: "请填写群组所在城市"
      }
    }

  });

};
$(function(){
  groupFormValidate();
});



