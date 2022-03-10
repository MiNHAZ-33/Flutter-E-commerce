import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  String text;
  ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool isHidden = true;

  double maxTextHeight = Dimensions.screenHeight / 5.62;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > maxTextHeight) {
      firstHalf = widget.text.substring(0, maxTextHeight.toInt());
      secondHalf =
          widget.text.substring(maxTextHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              height: 1.8,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                isHidden
                    ? SmallText(
                        text: firstHalf + '...',
                        height: 1.8,
                        color: AppColors.paraColor)
                    : SmallText(
                        text: firstHalf + secondHalf,
                        height: 1.8,
                        color: AppColors.paraColor),
                InkWell(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: Row(
                    children: [
                      isHidden
                          ? SmallText(
                              text: 'Show more',
                              height: 2.01,
                            )
                          : SmallText(
                              text: 'Show less',
                              height: 2.01,
                            ),
                      Icon(
                        isHidden
                            ? Icons.arrow_drop_down_outlined
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
