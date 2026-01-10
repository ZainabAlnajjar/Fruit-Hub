abstract class FavoriteRepository {
  Future<void> addFavorite(int saladId);
  Future<void> removeFavorite(int saladId);
  Future<bool> isFavorite(int saladId);
}