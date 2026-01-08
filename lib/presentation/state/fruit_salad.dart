class FruitSalad {
  final String name;
  final double price;
  final List<String> ingredients;
  final String description;
  final String image;
  final int? color;

  const FruitSalad({
    required this.name,
    required this.price,
    required this.ingredients,
    required this.description,
    required this.image,
    this.color,
  });
}
