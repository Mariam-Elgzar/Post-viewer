import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/model/Posts.dart';
import 'package:post/model/User.dart';
import 'package:post/values/colors.dart';
import 'package:post/view/HomeScreen.dart';

class CustomSearchDelegate extends SearchDelegate{
  final PostController postListController = Get.put(PostController());
  List<User> user = [];
  // List<Posts> searchTerms = [];
  @override
  List<Widget> buildActions(BuildContext context){
    // searchTerms = postListController.postList;
    return [
      IconButton(onPressed: (){
        query = '';
      },
          icon: const Icon(Icons.clear_rounded, color: main_color_4))
    ];
  }
  @override Widget buildLeading(BuildContext context){
    return IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_rounded, color: main_color_4,));
  }
  @override Widget buildResults(BuildContext context){
    // searchTerms = postListController.postList;
    List<Posts> matchQuery = [];
    for( var i in postListController.postList){
      if(i.toString().toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.title),
        );
      },
    itemCount: matchQuery.length,
    );
  }
  @override Widget buildSuggestions(BuildContext context){
    // searchTerms = postListController.postList;
    List<Posts> matchQuery = [];
    for( var i in postListController.postList){
      if(i.toString().toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.title),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}