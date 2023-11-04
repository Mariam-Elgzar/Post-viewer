import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:post/model/User.dart';
import 'package:post/values/constants.dart';

import '../model/Posts.dart';

class PostController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Posts> postList = <Posts>[].obs;
  final Map<int, User> users = {};
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(baseURLPost));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        // List<Posts> fetchedPosts = data.map((post) => Posts.fromJson(post)).toList();
        List<Posts> fetchedPosts = [];
        for (var json in data){
          Posts post = Posts.fromJson(json);
          User? user = users[post.userId];

          if(user == null){
            user = await getUser(post.userId);
            if(user != null){
              users[post.userId] = user;
            }
          }
          post.user = user;
          fetchedPosts.add(post);
        }
        postList.value = fetchedPosts;
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
  Future<User> getUser(int userId) async {
    try {
      final response = await http.get(Uri.parse('${baseURLUser}/$userId'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        User user = User.fromJson(data);

        return user;
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (e) {
      rethrow;
    }
  }
  Future addPost(Posts posts) async {
    try {
      final response = await http.post(Uri.parse(baseURLPost),
          body: json.encode(posts.toJson()));

      if (response.statusCode == 200) {
        // Map<String, dynamic> data = json.decode(response.body);
        // Posts posts = Posts.fromJson(data);
        return posts;
      } else {
        throw Exception('Failed to upload post');
      }
    } catch (e) {
      rethrow;
    }
  }
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}