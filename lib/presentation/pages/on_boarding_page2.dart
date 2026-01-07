import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/components/primary_button.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

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
                Image.asset(Assets.fruitBasketPage2,fit: BoxFit.contain),
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
                  "What is your firstname?",
                  style: TextStyle(
                    color: Color(FruitColor.navyBlueColor),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextField(),
                SizedBox(height: 58),
                FruitPrimaryButton(buttonText: "Start Ordering",isFullWidth: true, onPressed: (){})
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String firstName = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          firstName = value;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
        filled: true,
        fillColor: Color(FruitColor.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "First Name",
        hintStyle: TextStyle(
          color: Color(FruitColor.darkGrayColor),
          fontSize: 20,
        ),
      ),
    );
  }
}
