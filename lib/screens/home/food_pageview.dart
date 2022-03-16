import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/routes/page_routes.dart';
import 'package:food_delivery/screens/food/popular_food_detail.dart';
import 'package:food_delivery/utils/appconstant.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/column_with_rating.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '/widgets/icon_and_text.dart';

class FoodPageView extends StatefulWidget {
  FoodPageView({Key? key}) : super(key: key);

  @override
  State<FoodPageView> createState() => _FoodPageViewState();
}

class _FoodPageViewState extends State<FoodPageView> {
  final PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double scaleFactor = 0.8;
  double _height = Dimensions.foodItemContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.foodPageView,
                  //color: Colors.redAccent,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.isEmpty
                          ? 1
                          : popularProducts.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _foodItem(
                            index, popularProducts.popularProductList[index]);
                      }),
                )
              : const CircularProgressIndicator();
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.paddingHeight15,
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.paddingHeight30,
              bottom: Dimensions.paddingHeight30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              const SizedBox(
                width: 5,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: '.')),
              const SizedBox(
                width: 5,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food Pairing')),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.recommededFoods);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.paddingWidht20,
                            right: Dimensions.paddingWidht20,
                            bottom: Dimensions.paddingWidht20),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(AppConstant.BASE_URL +
                                        '/uploads/' +
                                        recommendedProduct
                                            .recommendedProductList[index]
                                            .img!),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!),
                                      SmallText(text: 'Well, this is chinese'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextAndIcon(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: AppColors.iconColor1),
                                          TextAndIcon(
                                              icon: Icons.location_on,
                                              text: 'Dhaka',
                                              iconColor: AppColors.iconColor2),
                                          TextAndIcon(
                                              icon: Icons.timer,
                                              text: '30 m',
                                              iconColor: AppColors.iconColor1),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator();
        }),
      ],
    );
  }

  Widget _foodItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == (_currentPageValue.floor() + 1)) {
      var currScale =
          scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == (_currentPageValue.floor() - 1)) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, (_height * (1 - currScale) / 2), 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.getPopularFood(index),
              );
            },
            child: Container(
              height: Dimensions.foodItemContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.paddingWidht10,
                  right: Dimensions.paddingWidht10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(AppConstant.BASE_URL +
                          "/uploads/" +
                          popularProduct.img!),
                      fit: BoxFit.cover),
                  color: index.isEven ? Colors.orange : Colors.lightGreen),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(
                  left: Dimensions.paddingWidht30,
                  right: Dimensions.paddingWidht30,
                  bottom: Dimensions.paddingHeight20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.paddingHeight15,
                      left: Dimensions.paddingWidht15,
                      right: Dimensions.paddingWidht15),
                  child: AppColumn(
                    title: popularProduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
