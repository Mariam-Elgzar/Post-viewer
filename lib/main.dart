import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/view/CreatePost.dart';
import 'package:post/view/HomeScreen.dart';
import 'package:post/view/LoginScreen.dart';
import 'package:post/view/ProfileScreen.dart';
import 'package:post/view/SignupScreen.dart';
import 'package:post/view/SplashScreen.dart';

void main() {
  runApp(const MyApp());
  print(PostController());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/create': (context) => const CreatePost(),

      },
    );
  }
}
