part of 'category_brand_cubit.dart';

sealed class CategoryBrandState {}

final class CategoryBrandCubitInitial extends CategoryBrandState {}

class CategoryLoadingState extends CategoryBrandState {}

class CategorySuccessState extends CategoryBrandState {
  final List<CategoryModel> categories;

  CategorySuccessState({required this.categories});
}

class CategoryErrorState extends CategoryBrandState {
  final String errorMessage;

  CategoryErrorState({required this.errorMessage});
}

class BrandLoadingState extends CategoryBrandState {}

class BrandSuccessState extends CategoryBrandState {
  final List<BrandModel> brands;

  BrandSuccessState({required this.brands});
}

class BrandErrorState extends CategoryBrandState {
  final String errorMessage;

  BrandErrorState({required this.errorMessage});
}

class CartLoadingState extends CategoryBrandState {}

class CartSuccessState extends CategoryBrandState {}

class CartErrorState extends CategoryBrandState {
  final String errorMessage;

  CartErrorState({required this.errorMessage});
}
