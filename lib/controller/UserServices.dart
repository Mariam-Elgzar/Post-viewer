// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:post/model/User.dart';
//
//
// class UserServices{
//   static Future<List<User>?> getUserData() async{
//     var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       return userFromJson(jsonData);
//     }else{
//       return null;
//     }
//
// }
// }