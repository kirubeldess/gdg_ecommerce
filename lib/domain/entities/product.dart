class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          imageUrl == other.imageUrl &&
          price == other.price;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      price.hashCode;

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price}';
  }
}