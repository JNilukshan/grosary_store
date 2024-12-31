class GroceryItem {
  final String name;
  final double price;
  final String imageUrl;
  final String category;

  GroceryItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}
