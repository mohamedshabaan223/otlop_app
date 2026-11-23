class CartModel {
  final int id, quantity;
  final String name, brand, category, image;
  final double price;

  CartModel({
    required this.id,
    required this.quantity,
    required this.name,
    required this.brand,
    required this.category,
    required this.image,
    required this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    // factory i can make some implmentation
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      name: json['productName'],
      brand: json['brand'],
      category: json['category'],
      image: json['pictureUrl'],
      price: json['price'],
    );
  }
}
