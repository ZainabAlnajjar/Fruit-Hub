import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/presentation/pages/widgets/plus_button.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../state/fruit_salad.dart';

class ColorfulSaladCard extends StatelessWidget {
  final FruitSalad salad;
  final VoidCallback? onPress;
  final VoidCallback? onPlusClick;

  const ColorfulSaladCard({
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
        width: 140,
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
          color: salad.color != null ? Color(salad.color!) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 64,
                        width: 64,
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
                    const SizedBox(height: 4),

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
                                  fontWeight: FontWeight.w500,
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
                  top: 8,
                  right: 8,
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