import 'package:food_delivery/screens/food/popular_food_detail.dart';
import 'package:food_delivery/screens/food/recommended_food.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String initialPage = '/';
  static const String popularFoods = '/popular-foods';
  static const String recommededFoods = '/recommended-foods';

  static String getInitialPage() => '$initialPage';
  static String getRecommendedFood(int x) => '$recommededFoods?pageid=$x';

  static String getPopularFood(int x) => '$popularFoods?pageid=$x';

  static List<GetPage> routes = [
    GetPage(
        name: initialPage,
        page: () {
          return MainFoodHomePage();
        }),
    GetPage(
        name: popularFoods,
        page: () {
          var id = Get.parameters['pageid'];

          return PopularFoodDetail(pageId: int.parse(id!));
        }),
    GetPage(
        name: recommededFoods,
        page: () {
          var id = Get.parameters['pageid'];
          return RecommendedFoodDetail(pageId: int.parse(id!));
        })
  ];
}
