import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';
import 'package:post/view/CreatePost.dart';
import 'Widgets/CustomSearchDelegate.dart';
import 'Widgets/PostCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeLabel, style: TextStyle(
          color: main_color_4
        ),),
        backgroundColor: secondary,
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate());
          }, icon: const Icon( Icons.search_rounded,
              color: main_color_4),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: bg_color,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Expanded(
                child: Obx(() {
                  if (postController.isLoading.value)
                    return Center(child: CircularProgressIndicator(color: main_color_4,));
                  else
                    return ListView.builder(
                      itemCount: postController.postList.length,
                      itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                PostCard(postController.postList[index])
                              );
                            }
                        );
                      },
                    ),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(() => const CreatePost());
      },
        elevation: dimen3,
        child: Icon(Icons.add, color: main_color_4,),
        backgroundColor: secondary,
      ),
    );
  }
}