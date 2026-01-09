import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/presentation/components/order_item.dart';
import 'package:fruit_hub/presentation/components/primary_button.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';
import '../components/app_bar.dart';
import '../state/fake_data.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FruitAbbBar(title: 'Order List'),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: fruitSalads.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3.5,
                maxCrossAxisExtent: 600,
              ),
              itemBuilder: (context, index) {
                final fruitSalad = fruitSalads[index];
                return OrderItem(
                  img: fruitSalad.image,
                  name: fruitSalad.name,
                  price: fruitSalad.price.toString(),
                  quantity: '5',
                  backgroundColor: Color(fruitSalad.color ?? 0),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 56),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icon.priceIcon),
                        SizedBox(width: 4),
                        Text(
                          "500.00",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: FruitColor.navyBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 24),
                Expanded(
                  child: FruitPrimaryButton(
                    buttonText: "Checkout",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
