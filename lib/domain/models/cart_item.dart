class CartItem {
  final int? id;
  final String name;
  final int price;
  final String image;
  final int color;
  final int quantity;


  const CartItem({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    required this.quantity,
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'color': color,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map){
    return CartItem(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      color: map['color'],
      quantity: map['quantity'],
    );
  }

}