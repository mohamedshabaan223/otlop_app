import 'package:otlop_app/feature/home/data/models/product.dart';

class ProductModel {
  final int? pageIndex;
  final int? pageSize;
  final int? count;
  final List<Product>? data;

  const ProductModel({this.pageIndex, this.pageSize, this.count, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    pageIndex: json['page_Index'] as int?,
    pageSize: json['page_Size'] as int?,
    count: json['count'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
