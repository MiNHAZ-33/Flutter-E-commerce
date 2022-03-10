import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/column_with_rating.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage('assets/image/food0.png'),
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
                AppIcon(icon: Icons.arrow_back),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
              decoration: BoxDecoration(
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
                    title: 'Chinese',
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
                      child: ExpandableText(
                          text:
                              'Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sin Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. t occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.paddingWidht10 / 3,
                  ),
                  BigText(text: '0', color: AppColors.signColor),
                  SizedBox(
                    width: Dimensions.paddingWidht10 / 3,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: BigText(text: '\$ 10 added to your cart '),
            ),
          ],
        ),
      ),
    );
  }
}
