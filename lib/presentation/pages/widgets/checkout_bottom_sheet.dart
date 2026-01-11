import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/pages/order_complete.dart';
import 'package:fruit_hub/presentation/pages/widgets/text_field.dart';

import '../../../util/colors.dart';
import 'card_payment_bottom_sheet.dart';
import 'outlined_button.dart';

class CheckOutBottomSheet extends StatelessWidget {
  const CheckOutBottomSheet({super.key});

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
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FruitOutlinedButton(
                            buttonText: "Pay on delivery",
                            onPressed: () async {
                              Navigator.pop(context);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderCompleteScreen()));
                            },
                          ),
                          FruitOutlinedButton(
                            buttonText: "Pay with card",
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return CardPaymentBottomSheet();
                                },
                              );
                            },
                          ),
                        ],
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
