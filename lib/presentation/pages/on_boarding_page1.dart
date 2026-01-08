import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/components/primary_button.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';
import 'on_boarding_page2.dart';

class OnBoardingPage1 extends StatelessWidget {

  const OnBoardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height / 1.8,
            color: Color(FruitColor.orangeColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:70),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(Assets.fruitDrops),
                  ),
                ),
                Image.asset(Assets.fruitBasketPage1, fit: BoxFit.contain),
                SizedBox(height: 8),
                Image.asset(Assets.fruitBasketPageShadow)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 56, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get The Freshest Fruit Salad Combo",
                  style: TextStyle(
                    color: Color(FruitColor.navyBlueColor),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                  Text(
                    "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
                    style: TextStyle(
                      color: Color(FruitColor.lightNavyBlueColor),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                SizedBox(height: 58),
                FruitPrimaryButton(buttonText: "Let’s Continue",isFullWidth: true, onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingPage2()));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}