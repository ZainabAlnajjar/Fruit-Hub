import 'package:fruit_hub/domain/models/basket_item.dart';

import '../models/cart.dart';
import '../models/salad.dart';

abstract class BasketRepository {
  Future<void> addToBasket({required int saladId, required int quantity});

  Future<List<BasketItem>> getBasketItems();
  Future<void> deleteCart();
  Future<List<Cart>> getBasketItemsWithDetails();

}