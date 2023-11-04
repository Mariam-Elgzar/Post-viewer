import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:post/values/constants.dart';

import '../model/User.dart';


// class UserController extends GetxController{
//   var userList = <User>[].obs;
//   var isLoading = true.obs;
//
//   @override
//   void onInit(){
//     fetchUser();
//     super.onInit();
//   }
//
//   void fetchUser() async{
//     try{
//       isLoading(true);
//       var user = await UserServices.getUserData();
//       if(user != null){
//         userList.value = user;
//       }
//     }
//     finally{
//       isLoading(false);
//     }
//   }
// }


class UserController extends GetxController {
  RxBool isLoading = true.obs;

  Future<User> getUser(int userId) async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse('${baseURLUser}/$userId'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        User user = User.fromJson(data);

        isLoading.value = false;

        return user;
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}