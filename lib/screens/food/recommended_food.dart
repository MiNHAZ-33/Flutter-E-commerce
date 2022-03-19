import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/routes/page_routes.dart';
import 'package:food_delivery/utils/appconstant.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getInitialPage());
                    },
                    child: AppIcon(icon: Icons.arrow_back)),
                GetBuilder<PopularProductController>(builder: (popularProduct) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
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
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: BigText(text: product.name!),
                  )),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstant.BASE_URL + '/uploads/' + product.img!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SmallText(
                size: 20,
                color: Colors.black,
                text: product.description!,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (recoProduct) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    recoProduct.setQuantity(false);
                  },
                  child: AppIcon(
                    icon: Icons.remove,
                    color: AppColors.mainColor,
                  ),
                ),
                BigText(
                    text: '\$${product.price}  X' +
                        recoProduct.getCartItems.toString()),
                GestureDetector(
                    onTap: () {
                      recoProduct.setQuantity(true);
                    },
                    child:
                        AppIcon(icon: Icons.add, color: AppColors.mainColor)),
              ],
            ),
            Container(
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
                  SizedBox(
                    width: Dimensions.paddingWidht10 / 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      recoProduct.addItem(product);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(15)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: BigText(
                          text: '\$ ${product.price} is added to your cart '),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.paddingWidht10 / 2,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
