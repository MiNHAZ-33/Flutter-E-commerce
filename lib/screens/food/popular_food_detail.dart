import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/routes/page_routes.dart';
import 'package:food_delivery/screens/cart/cart_page.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:food_delivery/utils/appconstant.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/column_with_rating.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var product =
    //     Get.find<PopularProductController>().popularProductList[pageId];

    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>().initQuantity();
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.mainFoodImageContainer,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        AppConstant.BASE_URL + '/uploads/' + product.img!),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.paddingHeight30,
            left: Dimensions.paddingWidht30,
            right: Dimensions.paddingWidht30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                     
                      Get.toNamed(Routes.initialPage);
                    },
                    child: const AppIcon(icon: Icons.arrow_back)),
                GetBuilder<PopularProductController>(builder: (popularProduct) {
                  return GestureDetector(
                    onTap: () {
                            if(popularProduct.totalItems >=1)
                            Get.toNamed(Routes.getCartPage());
                          },
                    child: Stack(
                      children: [
                        const AppIcon(
                            icon: Icons.shopping_cart_outlined),
                        popularProduct.totalItems >= 1
                            ? Positioned(
                                top: 3,
                                right: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  color: AppColors.mainColor,
                                  iconColor: Colors.transparent,
                                  size: 25,
                                ),
                              )
                            : Container(),
                        popularProduct.totalItems >= 1
                            ? Positioned(
                                top: 3,
                                right: 3,
                                child: BigText(
                                  text: popularProduct.totalItems.toString(),
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: Dimensions.mainFoodImageContainer - 20,
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingWidht20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    title: product.name!,
                  ),
                  SizedBox(
                    height: Dimensions.paddingHeight15,
                  ),
                  BigText(
                    text: 'Introduce',
                    size: 26,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description!),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (products) {
          return Container(
            height: 120,
            padding: EdgeInsets.only(
              top: Dimensions.paddingHeight15,
              bottom: Dimensions.paddingHeight15,
              left: Dimensions.paddingHeight10,
              right: Dimensions.paddingHeight10,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          products.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.paddingWidht10 / 3,
                      ),
                      BigText(
                          text: products.getCartItems.toString(),
                          color: AppColors.signColor),
                      SizedBox(
                        width: Dimensions.paddingWidht10 / 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          products.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    products.addItem(product);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: BigText(text: '\$ 10 added to your cart '),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
