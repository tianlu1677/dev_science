var usersSignInValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var usersSignInForm = $('#new_user');

  usersSignInForm.validate({
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 6
      }
    },
    messages: {
      "user[email]": {
        required: "请输入您的邮箱地址",
        email: "请输入您的邮箱地址"
      },
      "user[password]": {
        required: "请填写密码",
        minlength: "请输入至少六位的密码"
      }
    }

  });

};

var usersSignUpValidate = function() {
  // for more info visit the official plugin documentation:
  // http://docs.jquery.com/Plugins/Validation

  var usersSignuPForm = $('#users_sign_up');

  usersSignuPForm.validate({
    rules: {
      "user[username]":{
        required: true,
        minlength: 2,
        maxlength: 30
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 6
      },
      "user[password_confirmation]":{
        equalTo: "#user_password"
      }
    },


    messages: {
      "user[email]": {
        required: "请输入您的邮箱地址",
        email: "请输入您的邮箱地址"
      },
      "user[password]": {
        required: "请填写密码",
        minlength: "请输入至少六位的密码"
      }
    }

  });

};


$(function(){
  usersSignUpValidate();
});
