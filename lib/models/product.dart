class Product {
  final String id;
  final String name;
  final String subtitle;
  final String category;
  final int price;
  final int? oldPrice;
  final String emoji;
  final int colorValue;
  final String description;
  final bool featured;

  const Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.emoji,
    required this.colorValue,
    required this.description,
    this.featured = false,
  });
}
