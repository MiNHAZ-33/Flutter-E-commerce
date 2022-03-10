import 'package:flutter/material.dart';
import 'package:food_delivery/screens/food/popular_food_detail.dart';
import 'package:food_delivery/screens/food/recommended_food.dart';
import 'package:get/get.dart';

import 'screens/home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Food delivery',
        debugShowCheckedModeBanner: false,
        home: RecommendedFoodDetail()
        // home: MainFoodHomePage(),
        );
  }
}
