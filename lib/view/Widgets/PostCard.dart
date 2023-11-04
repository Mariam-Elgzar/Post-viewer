import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/model/Posts.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';
import 'package:post/view/ProfileScreen.dart';
import 'package:readmore/readmore.dart';

class PostCard extends StatelessWidget {
  final Posts post;
  const PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: main_color_4,
      elevation: dimen3,
      child: Padding(
        padding: EdgeInsets.all(dimen6),
        child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/post_img_3.jpg'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Text(
                              post.user!.name, // Fetching username from the User object
                              style: TextStyle(
                                color: secondary,
                                fontSize: dimen20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){

                              Get.to(() => ProfileScreen(post.user!));
                            },
                          ),
                          Text(
                            post.title,
                            style: TextStyle(
                              color: secondary,
                              fontSize: dimen15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ReadMoreText(
                            post.body,
                            trimLines: 2,
                            colorClickableText: meltGreen,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: showMore,
                            trimExpandedText: showLess,
                            style: TextStyle(
                              color: secondary,
                              fontSize: dimen10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        //     }
        //   },
        // ),
      ),
    );
  }
}
