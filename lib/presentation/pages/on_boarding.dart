import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../util/assets.dart';

class OnBoardingScreen extends StatelessWidget {
  final String img;
  final String welcomeText;
  final String? welcomeDescription;
  final String? firstName;
  final String buttonText;

  const OnBoardingScreen({
    super.key,
    required this.img,
    required this.welcomeText,
    this.welcomeDescription,
    this.firstName,
    required this.buttonText,
  });

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
            color: Color(0xFFFFA451),
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
                Image.asset(img),
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
                  welcomeText,
                  style: TextStyle(
                    color: Color(0xFF27214D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                firstName != null ? SizedBox(height: 16) : SizedBox(height: 8),
                if (welcomeDescription != null)
                  Text(
                    welcomeDescription!,
                    style: TextStyle(
                      color: Color(0xFF5D577E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                else
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(24, 14, 24, 14),
                      filled: true,
                      fillColor: Color(0xFFF3F1F1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "First Name",
                      hintStyle: TextStyle(
                        color: Color(0xFFC2BDBD),
                        fontSize: 20,
                      ),
                    ),
                  ),
                SizedBox(height: 58),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA451),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Center(
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}