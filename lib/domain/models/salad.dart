import 'salad_categories.dart';

class Salad {
  final int? id;
  final String name;
  final int price;
  final String image;
  final List<String> ingredients;
  final String description;
  final int? color;
  final List<SaladCategory> categories;

  const Salad({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    this.ingredients = const [],
    this.description = '',
    this.color,
    this.categories = const [],
  });

  // Convert to DB map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'ingredients': ingredients.join(','),
      'description': description,
      'color': color,
      'categories': categoriesToString(categories),
    };
  }

  // Convert from DB map
  factory Salad.fromMap(Map<String, dynamic> map) {
    return Salad(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      ingredients: map['ingredients'] != null && map['ingredients'] != ''
          ? (map['ingredients'] as String).split(',')
          : [],
      categories: categoriesFromString(map['categories'] ?? ''),
      description: map['description'] ?? '',
      color: map['color'],
    );
  }
}
