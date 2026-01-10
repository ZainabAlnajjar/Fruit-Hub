import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/presentation/cubit/home/home_state.dart';

import '../../../domain/models/salad.dart';
import '../../../domain/models/salad_categories.dart';
import '../../../domain/repository/salad_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final SaladRepository repository;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> loadSalads() async {
    emit(HomeLoading());

    try {
      final tabCategories = [
        SaladCategory.hottest,
        SaladCategory.popular,
        SaladCategory.newCombo,
        SaladCategory.top,
      ];

      final Map<SaladCategory, List<Salad>> tabData = {};
      for (var category in tabCategories) {
        final salads = await repository.getSaladsByCategory(category);
        tabData[category] = salads;
      }

      final otherCategories = SaladCategory.values.where(
        (c) => !tabCategories.contains(c),
      );

      List<Salad> recommendedSectionData = const [];
      for (var category in otherCategories) {
        final salads = await repository.getSaladsByCategory(category);
        recommendedSectionData = salads;
      }

      emit(
        HomeLoaded(
          tabData: tabData,
          recommendedSectionData: recommendedSectionData,
        ),
      );
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
