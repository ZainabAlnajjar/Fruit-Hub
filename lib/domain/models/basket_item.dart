class BasketItem {
  final int? id;
  final int saladId;
  final int quantity;

  const BasketItem({
    this.id,
    required this.saladId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'salad_id': saladId,
      'quantity': quantity,
    };
  }

  factory BasketItem.fromMap(Map<String, dynamic> map) {
    return BasketItem(
      id: map['id'],
      saladId: map['salad_id'],
      quantity: map['quantity'],
    );
  }

  BasketItem copyWith({
    int? id,
    int? saladId,
    int? quantity,
  }) {
    return BasketItem(
      id: id ?? this.id,
      saladId: saladId ?? this.saladId,
      quantity: quantity ?? this.quantity,
    );
  }
}