import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/feature/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:otlop_app/feature/home/data/models/category_model/category_model.dart';

part 'category_brand_state.dart';

class CategoryBrandCubit extends Cubit<CategoryBrandState> {
  CategoryBrandCubit() : super(CategoryBrandCubitInitial());
  HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource();
  void getCategories() async {
    emit(CategoryLoadingState());
    final response = await homeRemoteDataSource.getCategory();
    response.fold(
      (error) => emit(CartErrorState(errorMessage: error.message)),
      (catrgoryList) => emit(CategorySuccessState(categories: catrgoryList)),
    );
  }

  void getBrand() async {
    emit(BrandLoadingState());
    final response = await homeRemoteDataSource.getBrand();
    response.fold(
      (error) => emit(BrandErrorState(errorMessage: error.message)),
      (brandNames) => emit(BrandSuccessState(brands: brandNames)),
    );
  }

  void addCart({required int productId, required int quantity}) async {
    emit(CartLoadingState());
    final respone = await homeRemoteDataSource.addCart(
      proudectId: productId,
      qunatity: quantity,
    );
    respone.fold(
      (error) => emit(CartErrorState(errorMessage: error.message)),
      (val) => emit(CartSuccessState()),
    );
  }
}
