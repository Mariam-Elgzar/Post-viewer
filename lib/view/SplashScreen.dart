import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.of(context).pushReplacementNamed('/login');
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: main_color_4,
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                // const CircleAvatar(
                //   backgroundImage: AssetImage('assets/post_img_3.jpg'),
                // ),
                SizedBox(
                  height: Get.height*0.2 ,
                ),
                Text(postLabel,
                  style: TextStyle(
                      fontSize: dimen20,
                      fontWeight: FontWeight.bold,
                      color: bg_color),
                ),
              ],
            ),
      ),
    );
  }
}
