import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/util/colors.dart';

import '../../util/assets.dart';

class OrderItem extends StatelessWidget {
  final String img;
  final String name;
  final String price;
  final String quantity;
  final Color backgroundColor;

  const OrderItem({super.key, required this.img, required this.name, required this.price, required this.quantity, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor.withValues(alpha: 0.3),
              ),
              child: Image.asset(img,width: 64,height:64,fit: BoxFit.contain)
         ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
              SizedBox(height: 4,),
              Text("${quantity}packs",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
            ],
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.icon.priceIcon),
            SizedBox(width: 4,),
            Text(price,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: FruitColor.navyBlueColor),),
          ],
        )
      ],
    );
  }
}
