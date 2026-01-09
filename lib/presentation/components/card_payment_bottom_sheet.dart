import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/components/primary_button.dart';
import 'package:fruit_hub/presentation/components/text_field.dart';

import '../../util/colors.dart';

class CardPaymentBottomSheet extends StatelessWidget {
  const CardPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.close, color: Colors.black, size: 29),
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
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
                Text(
                  "Delivery address",
                  style: TextStyle(
                    color: FruitColor.navyBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextField(hint: "10th avenue, Lekki, Lagos State"),
                SizedBox(height: 24),
                Text(
                  "Delivery address",
                  style: TextStyle(
                    color: FruitColor.navyBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextField(hint: "09090605708"),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                        color: FruitColor.navyBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(hint: "10/30"),
                    Text(
                      "CCV",
                      style: TextStyle(
                        color: FruitColor.navyBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(hint: "123"),
                  ],
                ),
                SizedBox(height: 40,),
                FruitPrimaryButton(
                  buttonText: "Complete Order",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
