import 'package:flutter/material.dart';
import 'package:fruit_hub/util/colors.dart';

class ActionRow extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToBasket;

  const ActionRow({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onAddToBasket,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          GestureDetector(
            onTap: onFavoriteToggle,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: FruitColor.lightOrangeColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: FruitColor.orangeColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            child: GestureDetector(
              onTap: onAddToBasket,
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