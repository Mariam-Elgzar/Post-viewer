import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/controller/PostController.dart';
import 'package:post/model/Posts.dart';
import 'package:post/values/colors.dart';
import 'package:post/view/HomeScreen.dart';

class CustomSearchDelegate extends SearchDelegate{
  final PostController postListController = Get.put(PostController());
  List<Posts> searchTerms = [];
  @override
  List<Widget> buildActions(BuildContext context){
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
          Get.to(()=> HomeScreen());
        },
        icon: const Icon(Icons.arrow_back_ios_rounded, color: main_color_4,));
  }
  @override Widget buildResults(BuildContext context){
    List<Posts> matchQuery = [];
    for( var i in searchTerms){
      if(i.toString().toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result as String),
        );
      },
    itemCount: matchQuery.length,
    );
  }
  @override Widget buildSuggestions(BuildContext context){
    List<Posts> matchQuery = [];
    for( var mm in searchTerms){
      if(mm.toString().toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(mm);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result as String),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}