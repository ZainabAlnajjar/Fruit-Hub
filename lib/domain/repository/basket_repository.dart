import 'package:fruit_hub/domain/models/basket_item.dart';

abstract class BasketRepository {
  Future<void> addToBasket({required int saladId, required int quantity});

  Future<void> removeFromBasket(int id);

  Future<List<BasketItem>> getBasketItems();
}