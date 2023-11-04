import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/model/User.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';

import '../values/colors.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen(this.user);


  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());
    return Scaffold(
      backgroundColor: bg_color,
      appBar: AppBar(
        title: const Text(profileLabel, style: TextStyle(
            color: main_color_4
        ),),
        backgroundColor: secondary,
      ),
      body:SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(dimen20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(
                    height: dimen30,
                  ),
                  Text(user.name,style: TextStyle(
                      color: main_color_4,fontWeight: FontWeight.w500)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      SizedBox(
                        height: dimen30,
                      ),
                      Text('posts', style: TextStyle(
                          color: main_color_4),),
                      Text('followers', style: TextStyle(
                          color: main_color_4),),
                      Text('following', style: TextStyle(
                          color: main_color_4),),
                    ],
                  ),
                  SizedBox(
                    height: dimen30,
                  ),
                  Text(personalInfo, style: TextStyle(
                      color: main_color_4),),
                  SizedBox(
                    height: dimen30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: main_color_4,
                      borderRadius: BorderRadius.circular(dimen20),
                    ),
                    padding: const EdgeInsets.all(dimen10),
                    child: Padding(
                      padding: EdgeInsets.all(dimen20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_2_outlined, color: bg_color,),
                              Text(user.name, style: TextStyle(
                                  color: bg_color),),
                            ],
                          ),
                          SizedBox(
                            height: dimen30,
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone_android_outlined, color: bg_color,),
                              Text(user.phone, style: TextStyle(
                                  color: bg_color),),
                            ],
                          ),
                          SizedBox(
                            height: dimen30,
                          ),
                          Row(
                            children: [
                              Icon(Icons.email_outlined, color: bg_color,),
                              Text(user.email, style: TextStyle(
                                  color: bg_color),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
