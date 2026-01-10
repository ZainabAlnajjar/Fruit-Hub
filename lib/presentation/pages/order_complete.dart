import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/pages/home.dart';
import 'package:fruit_hub/presentation/pages/order_status.dart';
import 'package:fruit_hub/presentation/pages/widgets/outlined_button.dart';
import 'package:fruit_hub/presentation/pages/widgets/primary_button.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.image.orderComplete,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 48),
            Text(
              "Congratulations!!!",
              style: TextStyle(
                color: FruitColor.navyBlueColor,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Your order have been taken and \nis being attended to",
              style: TextStyle(
                color: FruitColor.navyBlueColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 58),
            FruitPrimaryButton(buttonText: "Track order", onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderStatusScreen()));
            }),
            SizedBox(height: 48),
            FruitOutlinedButton(buttonText: "Continue shopping",onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
