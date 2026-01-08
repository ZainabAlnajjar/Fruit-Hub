import 'package:flutter/material.dart';

import '../../util/colors.dart';

class FruitAbbBar extends StatelessWidget {
  final String title;

  const FruitAbbBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(FruitColor.orangeColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56,horizontal: 24),
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white
                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new,color: Colors.black),
                        SizedBox(width: 4),
                        Text("Go back",style: TextStyle(color: Color(FruitColor.navyBlueColor),fontSize: 16,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  )
              ),
            ),
            Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 24),)),
          ],
        ),
      ),
    );
  }
}
