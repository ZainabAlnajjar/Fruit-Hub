import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/pages/on_boarding.dart';
import 'package:fruit_hub/util/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub',
      theme: ThemeData(
        fontFamily: "brandonGrotesque",
      ),
      home: OnBoardingScreen(
        img: Assets.fruitBasketPage1,
        welcomeText: "Get The Freshest Fruit Salad Combo",
        buttonText: 'Let’s Continue',
        welcomeDescription: "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
      ),
    );
  }
}
