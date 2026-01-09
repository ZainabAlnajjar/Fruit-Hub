import 'package:flutter/material.dart';

import '../../util/colors.dart';

class FruitOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const FruitOutlinedButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: FruitColor.orangeColor,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          buttonText,
          style: TextStyle(
            color: FruitColor.orangeColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
