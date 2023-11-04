import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:post/values/strings.dart';
class LoginController extends GetxController{
  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController, usernameController;

  var email = '';
  var password = '';
  var username = '';

  @override
  void onInit(){
    super.onInit();
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
  }

  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return provideEmail;
    }
    return null;
  }

  String? validatePassword(String value){
    if(value.length < 8){
      return helperPasswordLabel;
    }
    return null;
  }
  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid){
      return;
    }loginFormKey.currentState!.save();

  }

}