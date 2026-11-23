import 'package:otlop_app/feature/home/data/models/product.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final List<Product> productList;

  new({required this.productList});
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  new({required this.errorMessage});
}
