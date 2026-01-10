import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/pages/widgets/details_image.dart';
import 'package:fruit_hub/presentation/pages/widgets/go_back_button.dart';
import 'package:fruit_hub/util/assets.dart';
import '../../util/colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FruitColor.orangeColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: FruitColor.orangeColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      GoBackButton(),
                      const SizedBox(height: 10),
                      DetailsImage(
                        Image.asset(
                          Assets.image.fruitSaladQuinoa,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Quinoa Fruit Salad',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: FruitColor.navyBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ), // TODO: Check spacing from design
                      Row(
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
                      ),
                      const SizedBox(height: 32),
                      Divider(color: Color(0xffF3F3F3), thickness: 1),
                      const SizedBox(height: 32),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: FruitColor.orangeColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'One Pack Contains:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: FruitColor.navyBlueColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                        style: TextStyle(
                          fontSize: 16,
                          color: FruitColor.lightNavyBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(color: Color(0xffF3F3F3), thickness: 1),
                      const SizedBox(height: 24),
                      Text(
                        'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // TODO: Toggle favorite
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
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
