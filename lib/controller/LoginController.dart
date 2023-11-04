import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:post/values/strings.dart';
class LoginController extends GetxController{
  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();

  late TextEditingController
  emailController,
      passwordController,
      usernameController,
      phoneNumberController,
      confirmPasswordController;

  var email = '';
  var password = '';
  var confirmPassword = '';
  var username = '';
  var phone = '';

  @override
  void onInit(){
    super.onInit();
    phoneNumberController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    confirmPasswordController.dispose();
  }

  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return provideEmail;
    }
    return null;
  }

  String? validatePassword(String value){
    if(value.length <= 8){
      return helperPasswordLabel;
    }
    return null;
  }
  bool validatePhone(String phone){
    if(phone.length < 11){
      return false;
    }else{
      return true;
    }
  }
  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    loginFormKey.currentState!.save();
  }
  bool validateUsername(String name) {
    // Check if the email address is empty.
    if (name.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
  bool isValidPassword(String password) {
    // Check if the password is at least 8 characters long.
    if (password.length <= 8) {
      return false;
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    } else if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    } else if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    } else if (!password.contains(RegExp(r'[!@#\$&*()\-+\.,\/:;<=>?^_`{|}~]'))) {
      return false;
    } else {
      return true;
    }
    // If all of the checks pass, then the password is valid.
  }

  bool isValidEmail(String email) {
    // Check if the email address is empty.
    if (email.isEmpty) {
      return false;
    } else if (!email.contains('@')) {
      return false;
    } else if (!email.contains('.')) {
      return false;
    } else {
      return true;
    }
    // If all of the checks pass, then the email address is valid.
  }
}

