import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.paddingHeight20*3,
            left: Dimensions.paddingWidht20,
            right: Dimensions.paddingWidht20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(icon: Icons.arrow_back_ios,
                iconColor: Colors.white,),
                SizedBox(width: Dimensions.paddingWidht15,),
                const AppIcon(icon: Icons.home_outlined,
                iconColor: Colors.white,),
                const AppIcon(icon: Icons.shopping_cart,
                iconColor: Colors.white,)
              ],
            ))
        ],
      ),
      
    );
  }
}