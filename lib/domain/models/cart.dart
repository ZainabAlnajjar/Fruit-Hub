import 'package:fruit_hub/domain/models/salad.dart';

class Cart {
  final Salad salad;
  final int quantity;

  Cart({required this.salad, required this.quantity});

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      salad: Salad.fromMap(map),
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    final saladMap = salad.toMap();
    saladMap['quantity'] = quantity;
    return saladMap;
  }

}
