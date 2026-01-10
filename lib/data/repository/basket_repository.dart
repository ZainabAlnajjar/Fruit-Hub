import 'package:fruit_hub/domain/models/salad.dart';

import '../../domain/models/basket_item.dart';
import '../../domain/models/cart.dart';
import '../../domain/repository/basket_repository.dart';
import '../database/database.dart';

class BasketRepositoryImpl implements BasketRepository {
  final FruitHupDatabase database;

  BasketRepositoryImpl(this.database);

  @override
  Future<void> addToBasket({required int saladId, required int quantity}) async {
    final db = await database.database;

    final existing = await db.query(
      'basket',
      where: 'salad_id = ?',
      whereArgs: [saladId],
      limit: 1,
    );

    if (existing.isNotEmpty) {
      final currentQuantity = existing.first['quantity'] as int;
      await db.update(
        'basket',
        {'quantity': currentQuantity + quantity},
        where: 'salad_id = ?',
        whereArgs: [saladId],
      );
    } else {
      await db.insert('basket', {
        'salad_id': saladId,
        'quantity': quantity,
      });
    }
  }

  @override
  Future<List<BasketItem>> getBasketItems() async {
    final db = await database.database;
    final result = await db.query('basket');
    return result.map((map) => BasketItem.fromMap(map)).toList();
  }

  @override
  Future<void> deleteCart()async {
   final db = await database.database;
   await db.delete('basket');
  }

  @override
  Future<List<Cart>> getBasketItemsWithDetails() async {
    final db = await database.database;
    final result = await db.rawQuery('''
    SELECT s.*, b.quantity
    FROM basket b
    JOIN salads s ON b.salad_id = s.id
  ''');

    return result.map((map) => Cart.fromMap(map)).toList();
  }


}