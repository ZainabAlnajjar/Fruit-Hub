import 'package:fruit_hub/data/repository/basket_repository';
import 'package:fruit_hub/data/repository/favorite_repository.dart';
import 'package:fruit_hub/domain/repository/basket_repository.dart';
import 'package:fruit_hub/domain/repository/favorite_repository.dart';
import 'package:fruit_hub/presentation/cubit/details/details_cubit.dart';
import 'package:get_it/get_it.dart';

import '../data/database/database.dart';
import '../data/repository/salad_repository.dart';
import '../domain/repository/salad_repository.dart';
import '../presentation/cubit/home/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt.registerLazySingleton<FruitHupDatabase>(
    () => FruitHupDatabase.instance,
  );

  getIt.registerLazySingleton<SaladRepository>(
    () => SaladRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<BasketRepository>(
    () => BasketRepositoryImpl(getIt()),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<SaladRepository>()));

  getIt.registerFactory<DetailsCubit>(
    () => DetailsCubit(
      saladRepository: getIt<SaladRepository>(),
      basketRepository: getIt<BasketRepository>(),
      favoriteRepository: getIt<FavoriteRepository>(),
    ),
  );
}
