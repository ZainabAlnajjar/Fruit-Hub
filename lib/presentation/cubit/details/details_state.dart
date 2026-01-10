import '../../../domain/models/salad.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final Salad salad;
  final int quantity;
  final bool isFavorite;

  DetailsLoaded({
    required this.salad,
    this.quantity = 1,
    this.isFavorite = false,
  });

  DetailsLoaded copyWith({
    Salad? salad,
    int? quantity,
    bool? isFavorite,
  }) {
    return DetailsLoaded(
      salad: salad ?? this.salad,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class DetailsError extends DetailsState {
  final String message;

  DetailsError({required this.message});
}