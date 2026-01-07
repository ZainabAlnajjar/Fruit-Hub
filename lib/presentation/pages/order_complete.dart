import 'package:flutter/material.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.orderComplete,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 48),
            Text(
              "Congratulations!!!",
              style: TextStyle(
                color: Color(FruitColor.navyBlueColor),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Your order have been taken and \nis being attended to",
              style: TextStyle(
                color: Color(FruitColor.navyBlueColor),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 58),
            ElevatedButton(
              onPressed: () {
                // navigate to track order screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(FruitColor.orangeColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                child: Text(
                  "Track order",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Color(FruitColor.orangeColor),
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                child: Text(
                  "Continue shopping",
                  style: TextStyle(
                    color: Color(FruitColor.orangeColor),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
