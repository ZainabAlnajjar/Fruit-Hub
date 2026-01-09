import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/presentation/pages/order_list.dart';
import 'package:fruit_hub/util/assets.dart';

import '../../util/colors.dart';
import '../state/fake_data.dart';
import '../state/fruit_salad.dart';
import 'widgets/basket_button.dart';
import 'widgets/colorful_salad_card.dart';
import 'widgets/list_section.dart';
import 'widgets/recommended_salad_card.dart';
import 'widgets/search_section.dart';
import 'widgets/tabbed_list.dart';
import 'widgets/welcome_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FruitColor.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: FruitColor.backgroundColor,
        elevation: 0,
        leading: SvgPicture.asset(
          Assets.icon.menu,
          width: 22,
          height: 11,
          fit: BoxFit.none,
        ),
        actions: [
          BasketButton(
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderList()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(name: 'Tony'),

              const SizedBox(height: 24),

              SearchSection(),

              const SizedBox(height: 40),

              ListSection(
                title: 'Recommended Combo',
                list: recommendedCombos,
                itemBuilder: (salad) => RecommendedSaladCard(
                  salad: salad,
                  onPress: () {
                    //   TODO: Navigate to details screen
                  },
                  onPlusClick: () {
                    //   TODO: Add to basket
                  },
                ),
              ),

              const SizedBox(height: 24),

              TabbedList<FruitSalad>(
                titles: ['Hottest', 'Popular', 'New combo', 'Top'],
                lists: [hottestCombos, popularCombos, newCombos, topCombos],
                itemBuilder: (salad) => ColorfulSaladCard(
                  salad: salad,
                  onPress: () {
                    //   TODO: Navigate to details screen
                  },
                  onPlusClick: () {
                    //   TODO: Add to basket
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
