import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/presentation/cubit/details/details_state.dart';

import '../../../domain/repository/salad_repository.dart';
import '../../../domain/repository/basket_repository.dart';
import '../../../domain/repository/favorite_repository.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final SaladRepository saladRepository;
  final BasketRepository basketRepository;
  final FavoriteRepository favoriteRepository;

  DetailsCubit({
    required this.saladRepository,
    required this.basketRepository,
    required this.favoriteRepository,
  }) : super(DetailsInitial());

  Future<void> loadSalad(int id) async {
    emit(DetailsLoading());

    try {
      final salad = await saladRepository.getSaladById(id);
      
      if (salad == null) {
        emit(DetailsError(message: 'Salad not found'));
        return;
      }

      final isFavorite = await favoriteRepository.isFavorite(id);

      emit(DetailsLoaded(
        salad: salad,
        quantity: 1,
        isFavorite: isFavorite,
      ));
    } catch (e) {
      emit(DetailsError(message: e.toString()));
    }
  }

  void increaseQuantity() {
    final currentState = state;
    if (currentState is DetailsLoaded) {
      emit(currentState.copyWith(quantity: currentState.quantity + 1));
    }
  }

  void decreaseQuantity() {
    final currentState = state;
    if (currentState is DetailsLoaded && currentState.quantity > 1) {
      emit(currentState.copyWith(quantity: currentState.quantity - 1));
    }
  }

  Future<void> toggleFavorite() async {
    final currentState = state;
    if (currentState is DetailsLoaded) {
      try {
        if (currentState.isFavorite) {
          await favoriteRepository.removeFavorite(currentState.salad.id!);
        } else {
          await favoriteRepository.addFavorite(currentState.salad.id!);
        }
        emit(currentState.copyWith(isFavorite: !currentState.isFavorite));
      } catch (e) {
        // TODO?
      }
    }
  }

  Future<void> addToBasket() async {
    final currentState = state;
    if (currentState is DetailsLoaded) {
      try {
        await basketRepository.addToBasket(
          saladId: currentState.salad.id!,
          quantity: currentState.quantity,
        );
      } catch (e) {
        // TODO?
      }
    }
  }
}