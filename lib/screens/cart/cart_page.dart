import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/appconstant.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/page_routes.dart';
import '../../utils/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.paddingHeight20 * 3 + 20,
            left: Dimensions.paddingWidht20,
            right: Dimensions.paddingWidht20,
            child: Container(
              width: double.maxFinite,
              // color: Colors.blue,
              height: 700,
              child: GetBuilder<CartController>(builder: (incart) {
                var cartList = incart.getItems;
                return ListView.builder(
                  itemCount: incart.getItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      margin: const EdgeInsets.all(3),
                      // color: Colors.greenAccent,
                      height: 90,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            //height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(AppConstant.BASE_URL +
                                      '/uploads/' +
                                      incart.getItems[index].img!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: 90,
                            width: Dimensions.containerWidth45 * 6,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: incart.getItems[index].name!),
                                SmallText(
                                  text: 'Spicy',
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text:
                                          '\$${incart.getItems[index].price.toString()}',
                                      color: Colors.red,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            incart.addItem(
                                                incart.getItems[index].product!,
                                                -1);
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
                                            text: cartList[index]
                                                .quantity!
                                                .toString(), // products.getCartItems.toString(),
                                            color: AppColors.signColor),
                                        SizedBox(
                                          width: Dimensions.paddingWidht10 / 3,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // products.setQuantity(true);
                                            incart.addItem(
                                                incart.getItems[index].product!,
                                                1);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.signColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
          Positioned(
            top: Dimensions.paddingHeight20 * 2.5,
            left: Dimensions.paddingWidht20,
            right: Dimensions.paddingWidht20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.getInitialPage());
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: Dimensions.paddingWidht15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.initialPage);
                  },
                  child: const AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    color: Colors.red,
                  ),
                ),
                const AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
