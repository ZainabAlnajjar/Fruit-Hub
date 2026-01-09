import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/components/primary_button.dart';
import 'package:fruit_hub/presentation/components/text_field.dart';

import '../../util/colors.dart';

class CardPaymentBottomSheet extends StatelessWidget {
  const CardPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
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
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Holders Name",
                        style: TextStyle(
                          color: FruitColor.navyBlueColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(hint: "Adolphus Chris"),
                      SizedBox(height: 24),
                      Text(
                        "Card Number",
                        style: TextStyle(
                          color: FruitColor.navyBlueColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(hint: "1234 5678 9012 1314"),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              ],
                            ),
                          ),
                          SizedBox(width: 24),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: FruitPrimaryButton(
                          buttonText: "Complete Order",
                          onPressed: () {},
                        ),
                      ),
                    ],
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
