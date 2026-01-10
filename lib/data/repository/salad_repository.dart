import '../../../domain/models/salad.dart';
import '../../domain/models/salad_categories.dart';
import '../database/database.dart';
import '../../../domain/repository/salad_repository.dart';

class SaladRepositoryImpl implements SaladRepository {
  final FruitHupDatabase database;

  SaladRepositoryImpl(this.database);

  @override
  Future<List<Salad>> getAllSalads() async {
    final db = await database.database;
    final result = await db.query('salads');
    return result.map(Salad.fromMap).toList();
  }

  @override
  Future<Salad?> getSaladById(int id) async {
    final db = await database.database;

    final result = await db.query(
      'salads',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return Salad.fromMap(result.first);
    }

    return null;
  }

  Future<List<Salad>> getSaladsByCategory(SaladCategory category) async {
    final db = await database.database;

    final result = await db.query(
      'salads',
      where: 'categories LIKE ?',
      whereArgs: ['%${category.key}%'],
    );

    return result.map(Salad.fromMap).toList();
  }

}