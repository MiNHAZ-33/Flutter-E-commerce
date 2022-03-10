import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  String title;

  AppColumn({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: title),
        SizedBox(
          height: Dimensions.sizedbox15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.blue,
                    size: 17,
                  );
                },
              ),
            ),
            SizedBox(
              width: Dimensions.paddingWidht15,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.paddingWidht15,
            ),
            SmallText(text: '1237 comments')
          ],
        ),
        SizedBox(
          height: Dimensions.sizedbox20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
