import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/presentation/pages/order_list.dart';
import 'package:fruit_hub/util/assets.dart';

import '../../di/injection.dart';
import '../../domain/models/salad.dart';
import '../../domain/models/salad_categories.dart';
import '../../util/colors.dart';
import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';
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
    final cubit = getIt<HomeCubit>();

    return BlocProvider<HomeCubit>(
      create: (_) => cubit..loadSalads(),
      child: Scaffold(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderList()),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state) {
                case HomeLoading():
                  return const Center(child: CircularProgressIndicator());

                case HomeLoaded():
                  return HomeContent(state: state);

                case HomeError():
                  return Center(child: Text('Error: ${state.message}'));

                case _:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final HomeLoaded state;

  const HomeContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final tabTitles = ['Hottest', 'Popular', 'New combo', 'Top'];

    final tabCategories = [
      SaladCategory.hottest,
      SaladCategory.popular,
      SaladCategory.newCombo,
      SaladCategory.top,
    ];

    final tabLists = tabCategories.map((c) => state.tabData[c] ?? []).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(name: 'Tony'),

          const SizedBox(height: 24),

          SearchSection(),

          const SizedBox(height: 40),

          ListSection(
            title: 'Recommended Combo',
            list: state.recommendedSectionData,
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

          TabbedList<Salad>(
            titles: tabTitles,
            lists: tabLists,
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
    );
  }
}
