import 'package:fruit_hub/domain/models/cart.dart';

import '../models/salad.dart';
import '../models/salad_categories.dart';

abstract class SaladRepository {

  Future<List<Salad>> getAllSalads();
  Future<Salad?> getSaladById(int id);
  Future<List<Salad>> getSaladsByCategory(SaladCategory category);
  Future<Cart> getCartItems();
  Future<void> addToCart(int id, int quantity);
  Future<void> deleteCart();
}
