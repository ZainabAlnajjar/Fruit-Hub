import 'package:flutter/material.dart';

import '../../util/colors.dart';

class FruitPrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const FruitPrimaryButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(FruitColor.orangeColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
