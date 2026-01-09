import 'package:flutter/material.dart';

import '../../util/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  const CustomTextField({super.key, required this.hint});


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String userInput = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          userInput = value;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
        filled: true,
        fillColor: FruitColor.greyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: FruitColor.darkGrayColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
