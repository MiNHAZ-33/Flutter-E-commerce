import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //Containers Height and width
  static double foodItemContainer = screenHeight / 3.10;
  static double foodPageView = screenHeight / 2.13;
  static double containerWidth45 = screenWidth / 9.13;
  static double containerHeight45 = screenWidth / 15.17;

  //sizedbox
  static double sizedbox20 = screenHeight / 34.15;
  static double sizedbox10 = screenHeight / 68.3;
  static double sizedbox15 = screenHeight / 45.53;

  //padding
  static double paddingHeight10 = screenHeight / 68.3;
  static double paddingHeight20 = screenHeight / 34.15;
  static double paddingHeight15 = screenHeight / 45.53;
  static double paddingHeight25 = screenHeight / 27.32;
  static double paddingHeight30 = screenHeight / 22.76;
  static double paddingWidht10 = screenWidth / 41.1;
  static double paddingWidht20 = screenWidth / 20.5;
  static double paddingWidht15 = screenWidth / 27.4;
  static double paddingWidht30 = screenWidth / 13.7;

  //popular food page
  static double mainFoodImageContainer = screenHeight / 2.71;
}
