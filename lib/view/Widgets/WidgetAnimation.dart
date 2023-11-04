

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:post/values/colors.dart';
import 'package:post/values/dimens.dart';
import 'package:post/values/strings.dart';

var height;
var width;
final controller = Get.put(SplashController());

Widget animatedContainer(){

  return Center(
    child: Obx(()=> AnimatedContainer(
      duration: Duration(seconds: 1),
      height: controller.height.value,
      width: controller.width.value,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dimen100)
      ),
      child: Image.asset('assets/post_img_3.jpg'),
    ),
    ),
  );
}

Widget footerText(){
  return Center(
    child: Obx(()=> AnimatedContainer(
        duration: const Duration(seconds: 1),
      margin: EdgeInsets.only(left: controller.postMargin.value),
      width: controller.postWidth.value,
      curve: Curves.easeInOut,
      child: Center(
        child: Obx(()=> controller.postMargin < 90? Text(postLabel,style: TextStyle(
            fontSize: controller.postFontSize.value,color: main_color_2),
        ):Text('')
        ),
      ),
    )),
  );
}

class SplashController extends GetxController{
  RxDouble width = 50.0.obs;
  RxDouble height = 50.0.obs;

  RxDouble postWidth = 0.0.obs;
  RxDouble postFontSize = 50.0.obs;
  RxDouble postMargin = 50.0.obs;
}

@override
onInit(){
  Future.delayed(Duration(seconds: 3),(){
    width.value = 150;
    height.value = 150;

  }
  );
}
