import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/presentation/cubit/order_list/order_list_cubit.dart';
import 'package:fruit_hub/presentation/pages/widgets/app_bar.dart';
import 'package:fruit_hub/presentation/pages/widgets/checkout_bottom_sheet.dart';
import 'package:fruit_hub/presentation/pages/widgets/order_item.dart';
import 'package:fruit_hub/presentation/pages/widgets/primary_button.dart';

import '../../di/injection.dart';
import '../../util/assets.dart';
import '../../util/colors.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<OrderListCubit>();

    return BlocProvider<OrderListCubit>(
      create: (context) => cubit..loadCartItems,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<OrderListCubit, OrderListState>(
          builder: (context, state) {
            switch (state) {
              case OrderListLoading():
                return const Center(child: CircularProgressIndicator());
              case OrderListLoaded():
                return OrderListContent(state: state);
              case OrderListError():
                return Center(child: Text('Error: ${state.message}'));
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class OrderListContent extends StatelessWidget {
  final OrderListLoaded state;

  const OrderListContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FruitAbbBar(title: 'Order List'),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 16),
            itemCount: state.cartItems.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3.5,
              maxCrossAxisExtent: 600,
            ),
            itemBuilder: (context, index) {
              return OrderItem(
                img: state.cartItems[index].image,
                name: state.cartItems[index].name,
                price: state.cartItems[index].price.toString(),
                quantity: state.cartItems[index].quantity.toString(),
                backgroundColor:Color(state.cartItems[index].color),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 56),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icon.priceIcon),
                      SizedBox(width: 4),
                      Text(
                        state.totalPrice.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: FruitColor.navyBlueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 24),
              Expanded(
                child: FruitPrimaryButton(
                  buttonText: "Checkout",
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return CheckOutBottomSheet();
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

