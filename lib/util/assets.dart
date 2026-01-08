
class Assets {
  Assets._();

  static const _baseImage = 'assets/images/';
  static const _baseIcon = 'assets/icons/';

  static const image = _Images();
  static const icon = _Icons();
}

class _Images {
  const _Images();

  final String fruitBasketPage1 =
      '${Assets._baseImage}fruit_basket_page1.png';
  final String fruitBasketPage2 =
      '${Assets._baseImage}fruit_basket_page2.png';
  final String fruitDrops =
      '${Assets._baseImage}fruit_drops.png';
  final String fruitBasketPageShadow =
      '${Assets._baseImage}fruit_basket_page_shadow.png';

  final String fruitSaladBerryMangoCombo =
      '${Assets._baseImage}fruit_salad_berry_mango_combo.png';
  final String fruitSaladHoneyLimeCombo =
      '${Assets._baseImage}fruit_salad_honey_lime_combo.png';
  final String fruitSaladMelon =
      '${Assets._baseImage}fruit_salad_melon.png';
  final String fruitSaladQuinoa =
      '${Assets._baseImage}fruit_salad_quinoa.png';
  final String fruitSaladTropical =
      '${Assets._baseImage}fruit_salad_tropical.png';
  final orderComplete = '${Assets._baseImage}order_complete.png';
}


class _Icons {
  const _Icons();

  final String search = '${Assets._baseIcon}ic_search.svg';
  final String filter = '${Assets._baseIcon}ic_filter.svg';
  final String heart = '${Assets._baseIcon}ic_heart.svg';
  final String basket = '${Assets._baseIcon}ic_basket.svg';
  final String menu = '${Assets._baseIcon}ic_menu.svg';
  final String moneyType = '${Assets._baseIcon}ic_money_type.svg';
  final String plus = '${Assets._baseIcon}ic_plus.svg';
}
