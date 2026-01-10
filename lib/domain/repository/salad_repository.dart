import '../models/salad.dart';
import '../models/salad_categories.dart';

abstract class SaladRepository {
  Future<List<Salad>> getAllSalads();

  Future<Salad?> getSaladById(int id);

  Future<List<Salad>> getSaladsByCategory(SaladCategory category);
}
