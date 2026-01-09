import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';

class BasketButton extends StatelessWidget {
  final VoidCallback? onPress;

  const BasketButton({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icon.basket,
              width: 24,
              height: 24,
              fit: BoxFit.none,
            ),
            Text(
              'My basket',
              style: TextStyle(
                fontSize: 10,
                color: Color(FruitColor.navyBlueColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}