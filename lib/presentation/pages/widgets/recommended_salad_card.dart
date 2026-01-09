import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../state/fruit_salad.dart';
import 'plus_button.dart';

class RecommendedSaladCard extends StatelessWidget {
  final FruitSalad salad;
  final VoidCallback? onPress;
  final VoidCallback? onPlusClick;

  const RecommendedSaladCard({
    super.key,
    required this.salad,
    this.onPress,
    this.onPlusClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 155,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0x0d202020),
              blurRadius: 60,
              offset: const Offset(0, 30),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(salad.image, fit: BoxFit.contain),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      salad.name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icon.moneyType,
                                width: 16,
                                height: 13,
                                fit: BoxFit.none,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                salad.price.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(FruitColor.orangeColor),
                                ),
                              ),
                            ],
                          ),

                          PlusButton(onPress: onPlusClick),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    Assets.icon.heart,
                    width: 16,
                    height: 14,
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
