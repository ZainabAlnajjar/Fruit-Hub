import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/presentation/components/order_item.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';
import '../components/app_bar.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FruitAbbBar(title: "My Basket"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: 10,scrollDirection: Axis.vertical,itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 24),
                child: OrderItem(img: Assets.orderItem, name: 'fruit salad', price: '500', quantity: '5', backgroundColor: FruitColor.orangeColor,),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 56),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.priceIcon),
                        SizedBox(width: 4,),
                        Text("500.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(FruitColor.navyBlueColor)),),
                      ],
                    )
                  ],
                ),
                ElevatedButton(onPressed: (){}, child: Text("Checkout")),
              ],
            ),
          )
        ],
      ),

    );
  }
}

