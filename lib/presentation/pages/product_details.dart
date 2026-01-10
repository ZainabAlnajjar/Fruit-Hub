import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/presentation/cubit/details/details_cubit.dart';
import 'package:fruit_hub/presentation/cubit/details/details_state.dart';
import 'package:fruit_hub/presentation/pages/widgets/action_row.dart';
import 'package:fruit_hub/presentation/pages/widgets/details_image.dart';
import 'package:fruit_hub/presentation/pages/widgets/go_back_button.dart';
import 'package:fruit_hub/presentation/pages/widgets/price_row.dart';
import '../../util/colors.dart';
import '../../di/injection.dart';

class ProductDetails extends StatelessWidget {
  final int saladId;

  const ProductDetails({super.key, required this.saladId});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<DetailsCubit>();

    return BlocProvider<DetailsCubit>(
      create: (_) => cubit..loadSalad(saladId),
      child: Scaffold(
        backgroundColor: FruitColor.orangeColor,
        body: SafeArea(
          bottom: false,
          child: BlocConsumer<DetailsCubit, DetailsState>(
            listener: (context, state) {
              if (state is DetailsLoaded) {}
            },
            builder: (context, state) {
              switch (state) {
                case DetailsLoading():
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );

                case DetailsLoaded():
                  return ProductDetailsContent(state: state);

                case DetailsError():
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: ${state.message}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Go Back'),
                        ),
                      ],
                    ),
                  );

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

class ProductDetailsContent extends StatelessWidget {
  final DetailsLoaded state;

  const ProductDetailsContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailsCubit>();
    final salad = state.salad;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: FruitColor.orangeColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GoBackButton(),
                  const SizedBox(height: 10),
                  DetailsImage(Image.asset(salad.image, fit: BoxFit.cover)),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          salad.name,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: FruitColor.navyBlueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  PriceRow(
                    quantity: state.quantity,
                    price: salad.price * state.quantity,
                    onDecrease: () => cubit.decreaseQuantity(),
                    onIncrease: () => cubit.increaseQuantity(),
                  ),
                  const SizedBox(height: 32),
                  Divider(color: Color(0xffF3F3F3), thickness: 1),
                  const SizedBox(height: 32),
                  if (salad.ingredients.isNotEmpty) ...[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: FruitColor.orangeColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'One Pack Contains:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: FruitColor.navyBlueColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      salad.ingredients.join(', '),
                      style: TextStyle(
                        fontSize: 16,
                        color: FruitColor.lightNavyBlueColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Color(0xffF3F3F3), thickness: 1),
                    const SizedBox(height: 24),
                  ],
                  if (salad.description.isNotEmpty) ...[
                    Text(
                      salad.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                  ActionRow(
                    isFavorite: state.isFavorite,
                    onFavoriteToggle: () async {
                      try {
                        await cubit.toggleFavorite();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${salad.name} added to favorites!',
                              ),
                              duration: const Duration(seconds: 2),
                              backgroundColor: FruitColor.orangeColor,
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to add to favorites'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    onAddToBasket: () async {
                      try {
                        await cubit.addToBasket();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${salad.name} added to basket!'),
                              duration: const Duration(seconds: 2),
                              backgroundColor: FruitColor.orangeColor,
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to add to basket'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
