import 'package:flutter/material.dart';
import 'package:fruit_hub/util/colors.dart';

class PriceRow extends StatelessWidget {
  final int quantity;
  final int price;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const PriceRow({
    super.key,
    required this.quantity,
    required this.price,
    required this.onDecrease,
    required this.onIncrease,
  });

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = price * quantity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onDecrease,
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
              '$quantity',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: FruitColor.navyBlueColor,
              ),
            ),
            const SizedBox(width: 24),
            GestureDetector(
              onTap: onIncrease,
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
          '₦ ${_formatPrice(totalPrice)}',
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