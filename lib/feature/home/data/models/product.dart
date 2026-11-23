class Product {
  final int? id;
  final String? name;
  final String? description;
  final String? pictureUrl;
  final double? price;
  final int? brandId;
  final String? brand;
  final int? categoryId;
  final String? category;

  const Product({
    this.id,
    this.name,
    this.description,
    this.pictureUrl,
    this.price,
    this.brandId,
    this.brand,
    this.categoryId,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    pictureUrl: json['pictureUrl'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    brandId: json['brandId'] as int?,
    brand: json['brand'] as String?,
    categoryId: json['categoryId'] as int?,
    category: json['category'] as String?,
  );
}
