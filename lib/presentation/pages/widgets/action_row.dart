import 'package:flutter/material.dart';
import 'package:fruit_hub/util/colors.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // TODO
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: FruitColor.lightOrangeColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.favorite_border,
                color: FruitColor.orangeColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // TODO
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: FruitColor.orangeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Add to basket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
