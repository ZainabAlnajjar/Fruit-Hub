import 'package:flutter/material.dart';

import '../../../util/colors.dart';

class WelcomeText extends StatelessWidget {
  final String name;

  const WelcomeText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.labelMedium,
          children: [
            TextSpan(
              text: 'Hello $name, ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(FruitColor.navyBlueColor),
              ),
            ),
            TextSpan(
              text: 'What fruit salad \ncombo do you want today?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(FruitColor.navyBlueColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}