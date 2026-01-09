import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';

class PlusButton extends StatelessWidget {
  final VoidCallback? onPress;

  const PlusButton({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Color(FruitColor.lightOrangeColor),
        child: SvgPicture.asset(Assets.icon.plus, width: 12, height: 12),
      ),
    );
  }
}