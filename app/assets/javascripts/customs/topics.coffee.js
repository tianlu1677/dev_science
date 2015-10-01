var topicFormValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var topicForm = $('#topic_form');

  topicForm.validate({
    rules: {
      "topic[title]": {
        minlength: 2,
        required: true
      }

    },
    messages: {
      "topic[title]": {
        minlength: "标题至少为2个字",
        required: "请填写的名称"
      }

    }

  });

};
$(function(){
  topicFormValidate();
});



