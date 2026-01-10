import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/pages/widgets/app_bar.dart';
import 'package:fruit_hub/util/colors.dart';

import '../../util/assets.dart';


class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FruitAbbBar(title: "Delivery Status"),
            OrderStatusItem(img: Assets.image.orderTaken, title: "Order Taken", orderStatus: Assets.image.orderReceived, backgroundColor: Colors.yellow),
            OrderStatusItem(img: Assets.image.orderPrepared, title: "Order Is Being Prepared", orderStatus: Assets.image.orderReceived, backgroundColor: FruitColor.navyBlueColor),
            OrderStatusItem(img: Assets.image.orderDelivered, title: "Order Is Being Delivered",description: "Your delivery agent is coming", orderStatus: Assets.image.phone, backgroundColor: FruitColor.orangeColor),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Image.asset(Assets.image.map,fit: BoxFit.contain,width: double.infinity,),
            ),
            OrderStatusItem(img: Assets.image.orderReceived, title: "Order Received", orderStatus: Assets.image.loading, backgroundColor: Colors.green),
          ],
        ),
      ),
    );
  }
}


class OrderStatusItem extends StatelessWidget {
  final String img;
  final String title;
  final String? description;
  final String orderStatus;
  final Color backgroundColor;


  const OrderStatusItem({super.key, required this.img, required this.title, required this.orderStatus, required this.backgroundColor, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor.withValues(alpha: 0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(img,width:56,height:56),
              )
          ),
          const SizedBox(width: 16),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                SizedBox(height: 4,),
                description!=null?Text(description!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),):Container(),
              ],
            ),
          ),
         Image.asset(orderStatus,width:orderStatus==Assets.image.orderReceived?24:40,height:orderStatus==Assets.image.orderReceived?24:40 ,)
        ],
      ),
    );
  }
}

