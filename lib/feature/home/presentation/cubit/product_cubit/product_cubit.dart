import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/feature/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:otlop_app/feature/home/presentation/cubit/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoadingState());
  final HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource();

  void getProduct() async {
    emit(ProductLoadingState());
    final response = await homeRemoteDataSource.getProduct();
    response.fold(
      (error) => emit(ProductErrorState(errorMessage: error.message)),
      (productList) => emit(ProductSuccessState(productList: productList)),
    );
  }
}
