import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';

import '../values/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  Text(postController.users.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email_outlined, color: bg_color,),
                            Text('mariam@gmail.com', style: TextStyle(
                                color: bg_color),),
                            SizedBox(
                              height: dimen30,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email_outlined, color: bg_color,),
                            Text('mariam@gmail.com', style: TextStyle(
                                color: bg_color),),
                            SizedBox(
                              height: dimen30,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email_outlined, color: bg_color,),
                            Text('mariam@gmail.com', style: TextStyle(
                                color: bg_color),),
                            SizedBox(
                              height: dimen30,
                            ),
                          ],
                        ),

                      ],
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
