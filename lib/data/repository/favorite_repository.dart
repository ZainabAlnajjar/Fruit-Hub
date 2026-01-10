import '../../domain/repository/favorite_repository.dart';
import '../database/database.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FruitHupDatabase database;

  FavoriteRepositoryImpl(this.database);

  @override
  Future<void> addFavorite(int saladId) async {
    final db = await database.database;
    
    final existing = await db.query(
      'favorites',
      where: 'salad_id = ?',
      whereArgs: [saladId],
      limit: 1,
    );

    if (existing.isEmpty) {
      await db.insert('favorites', {'salad_id': saladId});
    }
  }

  @override
  Future<void> removeFavorite(int saladId) async {
    final db = await database.database;
    await db.delete(
      'favorites',
      where: 'salad_id = ?',
      whereArgs: [saladId],
    );
  }

  @override
  Future<bool> isFavorite(int saladId) async {
    final db = await database.database;
    final result = await db.query(
      'favorites',
      where: 'salad_id = ?',
      whereArgs: [saladId],
      limit: 1,
    );
    return result.isNotEmpty;
  }
}