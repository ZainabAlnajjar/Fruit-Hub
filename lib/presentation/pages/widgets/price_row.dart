import 'package:flutter/material.dart';
import 'package:fruit_hub/util/colors.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // TODO
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xff333333),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  size: 16,
                  color: Color(0xff333333),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Text(
              '1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: FruitColor.navyBlueColor,
              ),
            ),
            const SizedBox(width: 24),
            GestureDetector(
              onTap: () {
                // TODO
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: FruitColor.lightOrangeColor,
                ),
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: FruitColor.orangeColor,
                ),
              ),
            ),
          ],
        ),
    
        Text(
          '₦ 2,000',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: FruitColor.navyBlueColor,
          ),
        ),
      ],
    );
  }
}