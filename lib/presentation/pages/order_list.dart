import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/presentation/pages/widgets/app_bar.dart';
import 'package:fruit_hub/presentation/pages/widgets/checkout_bottom_sheet.dart';
import 'package:fruit_hub/presentation/pages/widgets/order_item.dart';
import 'package:fruit_hub/presentation/pages/widgets/primary_button.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';
import '../state/fake_data.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context){
                        return CheckOutBottomSheet();
                      });
                    },
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
