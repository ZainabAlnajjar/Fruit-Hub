import 'package:fruit_hub/domain/models/basket_item.dart';

import '../models/cart.dart';

abstract class BasketRepository {
  Future<void> addToBasket({required int saladId, required int quantity});

  Future<List<BasketItem>> getBasketItems();
  Future<List<Cart>> getBasketItemsWithDetails();

}