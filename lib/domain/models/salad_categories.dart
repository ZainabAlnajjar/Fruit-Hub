enum SaladCategory {
  recommended('recommended'),
  hottest('hottest'),
  popular('popular'),
  newCombo('new'),
  top('top');

  final String key;

  const SaladCategory(this.key);
}

List<SaladCategory> categoriesFromString(String value) {
  return value.split(',').map((key) {
    return SaladCategory.values.firstWhere((e) => e.key == key);
  }).toList();
}

String categoriesToString(List<SaladCategory> categories) {
  return categories.map((e) => e.key).join(',');
}
