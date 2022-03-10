import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import 'food_pageview.dart';

class MainFoodHomePage extends StatelessWidget {
  const MainFoodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Bangladesh',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Dhaka',
                            color: Colors.black,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: Dimensions.containerWidth45,
                    width: Dimensions.containerWidth45,
                    child: const Icon(Icons.search),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FoodPageView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
