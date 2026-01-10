import 'dart:convert';

import 'package:fruit_hub/domain/models/cart_item.dart';

class Cart {

  final int? id;
  final List<CartItem>? cartItem;
  final int? totalPrice;

  Cart({this.id, this.cartItem, this.totalPrice});


  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'cartItem': jsonEncode(cartItem?.map((e) => e.toMap()).toList()),
      'totalPrice': totalPrice,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map){
    return Cart(
        id: map['id'],
        cartItem: (jsonDecode(map['cartItem']) as List)
        .map((e) => CartItem.fromMap(e))
        .toList(),
        totalPrice: map['totalPrice'],
    );
  }

}