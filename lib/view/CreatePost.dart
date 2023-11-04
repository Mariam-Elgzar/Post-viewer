import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/model/Posts.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';
import 'package:post/view/HomeScreen.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());
    var addPostController = TextEditingController();
    return Scaffold(
      backgroundColor: bg_color,
      appBar: AppBar(
        backgroundColor: secondary,
        title: const Text(createPostLabel, style: TextStyle(
        color: main_color_4),)
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child:Padding(padding: const EdgeInsets.all(dimen15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: main_color_4,
                  borderRadius: BorderRadius.circular(dimen20),
                ),
                padding: const EdgeInsets.all(dimen10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(icon: const Icon(Icons.close),onPressed: (){
                      Get.to(()=> const HomeScreen());
                    },),
                    TextField(
                      controller: addPostController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: whatYouThinkAbout,
                        focusColor: bg_color,
                        prefixIcon: const Icon(Icons.note_alt_rounded, color: bg_color,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(dimen20)),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(secondary),
                  ),
                      onPressed: () {
                    CircularProgressIndicator(color: main_color_4,);
                      Navigator.of(context).pop();
                    // postController.addPost();
              }, child: const Text(postLabel,
                style: TextStyle(
                    fontSize: dimen15,
                    color: main_color_4),

              ))
            ],
          ),
          ) ,

        ),
      ),
    );
  }
}
