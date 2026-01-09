import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/components/primary_button.dart';
import 'package:fruit_hub/presentation/pages/home.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';
import '../components/text_field.dart';

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height / 1.8,
            color: FruitColor.orangeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:70),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(Assets.image.fruitDrops),
                  ),
                ),
                Image.asset(Assets.image.fruitBasketPage2,fit: BoxFit.contain),
                SizedBox(height: 8),
                Image.asset(Assets.image.fruitBasketPageShadow)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 56, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What is your firstname?",
                  style: TextStyle(
                    color: FruitColor.navyBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextField(hint: "First Name"),
                SizedBox(height: 58),
                FruitPrimaryButton(buttonText: "Start Ordering",isFullWidth: true, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
