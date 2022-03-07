import 'package:flutter/material.dart';

import 'home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery',
      debugShowCheckedModeBanner: false,
      home: MainFoodHomePage(),
      
    );
  }
}