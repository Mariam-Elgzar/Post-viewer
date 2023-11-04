import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/LoginController.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';
import 'package:post/view/HomeScreen.dart';
import 'package:post/view/SignupScreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;


  @override
  void initState(){
    super.initState();
    passwordVisible = true;

  }
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: bg_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: dimen20, vertical: dimen10),
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
                const SizedBox(
                  height: dimen40,
                ),
                const Text(welcomeBack, style: TextStyle(fontSize: dimen30, color: main_color_4)),
                const SizedBox(
                  height: dimen30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                prefixIcon: Icon(Icons.person_rounded),
                fillColor: white,
                border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                labelText: userNameLabel,
                hintText: enterUserNameLabel
                ),
                  controller: controller.usernameController,
                  onSaved: (value){
                    controller.username= value!;
                  },
                ),
                const SizedBox(
                  height: dimen40,
                ),
                TextFormField(
                  autocorrect: false,
                  obscureText: passwordVisible,
                  enableSuggestions: false,
                  controller: controller.passwordController,
                  onSaved: (value){
                    controller.password= value!;
                  },
                  validator: (value){
                    return controller.validatePassword(value!);
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_rounded),
                    filled: true,
                    fillColor: white,
                    border: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: gray)),
                    labelText: passwordLabel,
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
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: dimen40,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  onSaved: (value){
                    controller.email= value!;
                  },
                  validator: (value){
                    return controller.validateEmail(value!);
                  },
                  decoration: const InputDecoration(
                      filled: true,
                    prefixIcon: Icon(Icons.email_rounded),
                    fillColor: white,
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: gray)),
                    labelText: emailLabel,
                    hintText: enterEmailLabel
                ),),
                const SizedBox(
                  height: dimen50,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                      ),
                      backgroundColor: MaterialStateProperty.all(secondary),
                    ),
                      onPressed: (){
                        if (controller.validateUsername(controller.usernameController.text) &&
                            controller.isValidEmail(controller.emailController.text) &&
                            controller.isValidPassword(controller.passwordController.text)) {
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
                      child: const Text(
                        login,
                        style: TextStyle(fontSize: dimen15, color: main_color_4),
                      )
                  ),
                ),
                const SizedBox(
                  height: dimen40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(doNotHaveAcc,style: TextStyle(fontSize: dimen15, color: white),),
                    InkWell(
                      onTap: (){Get.to(() => const SignupScreen());},
                        child:
                        const Text( signup,
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
      ),
    );
  }
}
