import 'package:food_delivery/screens/food/popular_food_detail.dart';
import 'package:food_delivery/screens/food/recommended_food.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String initialPage = '/';
  static const String popularFoods = '/popular-foods';
  static const String recommededFoods = '/recommended-foods';

 

  static String getInitialPage() => '$initialPage';
  static String getRecommendedFood() => '$recommededFoods';

   static String getPopularFood(int pageId) =>
      '$popularFoods ? pageId = $pageId';

  static List<GetPage> routes = [
    GetPage(name: initialPage, page: () => MainFoodHomePage()),
    GetPage(
        name: popularFoods,
        page: () {
          var pageId = Get.parameters['pageId'];
          print('We are at page' + pageId.toString());
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: recommededFoods,
        page: () {
          return RecommendedFoodDetail();
        })
  ];
}
