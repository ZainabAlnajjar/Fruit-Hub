import 'package:get_it/get_it.dart';

import '../data/database/database.dart';
import '../data/repository/salad_repository.dart';
import '../domain/repository/salad_repository.dart';
import '../presentation/cubit/home/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt.registerLazySingleton<SaladDatabase>(() => SaladDatabase.instance);

  getIt.registerLazySingleton<SaladRepository>(
    () => SaladRepositoryImpl(getIt()),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<SaladRepository>()));
}
