// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

import 'User.dart';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  int userId;
  int id;
  String title;
  String body;
  User? user;

  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.user,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
    "user": user,
  };
}
