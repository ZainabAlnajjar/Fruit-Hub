class FruitSalad {
  final String name;
  final int price;
  final String image;
  final List<String> ingredients;
  final String description;
  final int? color;

  const FruitSalad({
    required this.name,
    required this.price,
    required this.image,
    this.ingredients = const [],
    this.description = '',
    this.color,
  });
}
