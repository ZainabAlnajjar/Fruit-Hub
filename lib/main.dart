import 'package:flutter/material.dart';
import 'package:fruit_hub/presentation/pages/on_boarding_page1.dart';
import 'package:fruit_hub/presentation/pages/order_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub',
      theme: ThemeData(
        fontFamily: "brandonGrotesque",
      ),
      home: const OnBoardingPage1(),
    );
  }
}
