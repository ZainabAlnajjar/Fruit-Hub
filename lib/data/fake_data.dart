import '../../util/assets.dart';
import '../../domain/models/salad.dart';
import '../domain/models/salad_categories.dart';

final List<Salad> fakeSalads = [
  Salad(
    name: 'Quinoa Fruit Salad',
    price: 2000,
    image: Assets.image.fruitSaladQuinoa,
    color: SaladColors.yellow,
    ingredients: [
      'Red Quinoa',
      'Lime',
      'Honey',
      'Blueberries',
      'Strawberries',
      'Mango',
      'Fresh mint',
    ],
    description:
    'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you.',
    categories: [
      SaladCategory.hottest,
      SaladCategory.popular,
      SaladCategory.top,
    ],
  ),

  Salad(
    name: 'Tropical Fruit Salad',
    price: 1800,
    image: Assets.image.fruitSaladTropical,
    color: SaladColors.pink,
    ingredients: [
      'Pineapple',
      'Mango',
      'Papaya',
      'Banana',
      'Kiwi',
      'Coconut flakes',
      'Fresh mint',
    ],
    description:
    'A refreshing and exotic fruit salad with vibrant tropical flavors.',
    categories: [
      SaladCategory.popular,
      SaladCategory.recommended,
    ],
  ),

  Salad(
    name: 'Melon Fruit Salad',
    price: 1500,
    image: Assets.image.fruitSaladMelon,
    color: SaladColors.purple,
    ingredients: [
      'Watermelon',
      'Cantaloupe',
      'Honeydew melon',
      'Lime juice',
      'Fresh mint',
    ],
    description:
    'A light and hydrating fruit salad, perfect for hot days.',
    categories: [
      SaladCategory.newCombo,
      SaladCategory.recommended,
    ],
  ),

  Salad(
    name: 'Honey Lime Fruit Salad',
    price: 1600,
    image: Assets.image.fruitSaladHoneyLimeCombo,
    color: SaladColors.orange,
    ingredients: [
      'Apple',
      'Grapes',
      'Orange',
      'Kiwi',
      'Pineapple',
      'Honey',
      'Fresh lime juice',
      'Mint leaves',
    ],
    description:
    'A naturally sweet fruit salad with a citrus twist.',
    categories: [
      SaladCategory.hottest,
      SaladCategory.recommended,
    ],
  ),

  Salad(
    name: 'Berry Mango Combo',
    price: 1900,
    image: Assets.image.fruitSaladBerryMangoCombo,
    color: SaladColors.green,
    ingredients: [
      'Mango',
      'Strawberries',
      'Blueberries',
      'Raspberries',
      'Blackberries',
      'Lime zest',
      'Fresh mint',
    ],
    description:
    'A sweet and tangy combo packed with antioxidants.',
    categories: [
      SaladCategory.top,
      SaladCategory.popular,
    ],
  ),

  Salad(
    name: 'Classic Fresh Fruit Salad',
    price: 1400,
    image: Assets.image.fruitSaladQuinoa,
    color: SaladColors.yellow,
    ingredients: [
      'Apple',
      'Banana',
      'Orange',
      'Grapes',
      'Seasonal fruits',
      'Honey drizzle',
    ],
    description:
    'A simple and wholesome fruit salad for everyday freshness.',
    categories: [
      SaladCategory.popular,
    ],
  ),

  Salad(
    name: 'Citrus Delight Fruit Salad',
    price: 1700,
    image: Assets.image.fruitSaladMelon,
    color: SaladColors.orange,
    ingredients: [
      'Orange',
      'Grapefruit',
      'Mandarin',
      'Pineapple',
      'Lime juice',
      'Honey',
    ],
    description:
    'Bright, zesty, and refreshing citrus flavors.',
    categories: [
      SaladCategory.newCombo,
      SaladCategory.recommended,
    ],
  ),

  Salad(
    name: 'Berry Blast Fruit Salad',
    price: 2100,
    image: Assets.image.fruitSaladBerryMangoCombo,
    color: SaladColors.pink,
    ingredients: [
      'Strawberries',
      'Blueberries',
      'Raspberries',
      'Blackberries',
      'Honey',
      'Fresh mint',
    ],
    description:
    'A fruit salad rich in flavor and antioxidants.',
    categories: [
      SaladCategory.hottest,
      SaladCategory.top,
    ],
  ),
];

class SaladColors {
  static const yellow = 0xFFFFFAEB;
  static const pink = 0xFFFEF0F0;
  static const purple = 0xFFF1EFF6;
  static const green = 0xFFE9F6FB;
  static const orange = 0xFFFFE5D0;
}
