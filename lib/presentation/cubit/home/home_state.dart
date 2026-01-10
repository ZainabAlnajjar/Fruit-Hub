import '../../../domain/models/salad.dart';
import '../../../domain/models/salad_categories.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Map<SaladCategory, List<Salad>> tabData;
  final List<Salad> recommendedSectionData;

  HomeLoaded({required this.tabData, required this.recommendedSectionData});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
