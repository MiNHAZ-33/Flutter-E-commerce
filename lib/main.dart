import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/page_routes.dart';
import 'package:food_delivery/screens/cart/cart_page.dart';
import 'package:get/get.dart';

import 'controllers/recommended_product_controller.dart';
import 'screens/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Food delivery',
      debugShowCheckedModeBanner: false,
      // home: MainFoodHomePage(),
      home: CartPage(),
      getPages: Routes.routes,
      // home: MainFoodHomePage(),
    );
  }
}
