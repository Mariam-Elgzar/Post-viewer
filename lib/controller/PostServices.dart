// import 'package:http/http.dart' as http;
// import 'package:post/model/Posts.dart';
// import 'package:post/values/constants.dart';
//
//
// class PostServices {
//   static var client = http.Client();
//    static Future<List<Posts>?> fetchPosts() async{
//      var response = await client.get(Uri.parse(baseURL));
//      if(response.statusCode == 200){
//        var jsonString = response.body;
//        return postsFromJson(jsonString);
//      }else{
//        return null;
//      }
//
//    }
// }