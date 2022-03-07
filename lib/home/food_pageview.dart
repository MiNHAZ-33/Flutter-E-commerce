import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageView extends StatelessWidget {
  FoodPageView({Key? key}) : super(key: key);

  final PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.redAccent,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _foodItem(index);
          }),
    );
  }

  Widget _foodItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/image/food0.png',
                  ),
                  fit: BoxFit.cover),
              color: index.isEven ? Colors.orange : Colors.lightGreen),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Orange mandarilion'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.blue,
                              size: 17,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '4.5'),
                      SizedBox(
                        width: 15,
                      ),
                      SmallText(text: '1237 comments')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
