import 'package:flutter/material.dart';

import '../../util/colors.dart';

class FruitPrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool? isFullWidth;

  const FruitPrimaryButton({super.key, required this.buttonText, required this.onPressed, this.isFullWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  isFullWidth!=null? double.infinity: null,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: FruitColor.orangeColor,
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
      ),
    );
  }
}
