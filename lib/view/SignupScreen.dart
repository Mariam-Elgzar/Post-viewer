import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';
import 'package:post/view/HomeScreen.dart';

import '../controller/LoginController.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void initState(){
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: bg_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.symmetric(
              horizontal: dimen20,
              vertical: dimen10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: dimen150,
                  width: dimen150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimen50),
                  ),
                  child: Image.asset('assets/post_img_3.jpg',fit: BoxFit.fill),
                ),
                Container(
                  margin: const EdgeInsets.only(top: dimen30),
                alignment: Alignment.center,
                  child: const Text(createAccount,
                    style: TextStyle(fontSize: dimen30,
                      color: main_color_4),
                  ),
                ),
                const SizedBox(
                  height: dimen40,
                ),
                Form(
                  key: controller.loginFormKey,
                  child:
                Column(
                  children: [
                    TextFormField(
                      controller: controller.usernameController,
                      onSaved: (value){
                        controller.username= value!;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: white,
                        prefixIcon: Icon(Icons.create_rounded),
                        labelText: userNameLabel,
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                        hintText: enterUserNameLabel
                    ),),
                    const SizedBox(
                      height: dimen20,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      onSaved: (value){
                        controller.password= value!;
                      },
                      validator: (value){
                        return controller.validatePassword(value!);
                      },
                      autocorrect: false,
                      obscureText: passwordVisible,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: white,
                        prefixIcon: const Icon(Icons.lock_rounded),
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                        labelText: passwordLabel,
                        // errorText: errorPasswordLabel ,
                        hintText: enterPasswordLabel,
                        helperText: helperPasswordLabel,
                        helperStyle: const TextStyle(color: gray),suffixIcon: IconButton(onPressed: () {
                        setState((){
                          passwordVisible = !passwordVisible;
                        },);
                      },
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off)
                      ),
                        alignLabelWithHint: false,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,),
                    const SizedBox(
                      height: dimen20,
                    ),
                    TextFormField(
                      controller: controller.confirmPasswordController,
                      onSaved: (value){
                        controller.password= value!;
                      },
                      validator: (value){
                        return controller.validatePassword(value!);
                      },
                      autocorrect: false,
                      obscureText: confirmPasswordVisible,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: white,
                        prefixIcon: const Icon(Icons.lock_rounded),
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                        labelText: confirmPasswordLabel,
                        hintText: confirmYourPasswordLabel,
                        suffixIcon: IconButton(onPressed: () {
                          setState((){
                            confirmPasswordVisible = !confirmPasswordVisible;
                          },);
                        },
                            icon: Icon(confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)
                        ),
                        alignLabelWithHint: false,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,),
                    const SizedBox(
                      height: dimen20,
                    ),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      onSaved: (value){
                        controller.phone = value!;
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: white,
                          labelText: phoneNumberLabel,
                          prefixIcon: Icon(Icons.phone_rounded),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                          hintText: phoneNumberLabel
                      ),),
                    const SizedBox(
                      height: dimen20,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      onSaved: (value){
                        controller.email= value!;
                      },
                      validator: (value){
                        return controller.validateEmail(value!);
                      },
                      decoration: const InputDecoration(
                      filled: true,
                      fillColor: white,
                      prefixIcon: Icon(Icons.email_rounded),
                      labelText: emailLabel,
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                      hintText: enterEmailLabel,
                    ),),
                    const SizedBox(
                      height: dimen50,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(secondary),
                          ),
                          onPressed: (){
                            if (controller.validateUsername(controller.usernameController.text) &&
                                controller.isValidEmail(controller.emailController.text) &&
                                controller.isValidPassword(controller.passwordController.text) &&
                                controller.validatePhone(controller.phoneNumberController.text) &&
                                controller.isValidPassword(controller.confirmPasswordController.text)
                            ) {
                              Get.to(() => const HomeScreen());
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(alert),
                                    content:Text(checkTheField),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(close),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Text(signup, style: TextStyle(fontSize: dimen15, color: main_color_4),)
                      ),
                    ),
                ],
                ),
                ),

                const SizedBox(
                  height: dimen40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(alreadyHaveAcc,style: TextStyle(fontSize: dimen15, color: white),),
                    InkWell(
                      onTap: (){Get.to(() => const LoginScreen());},
                      child:
                      const Text( login,
                        style: TextStyle(
                            fontSize: dimen15,
                            color: blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
