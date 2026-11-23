import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:otlop_app/core/errors/error_handler.dart';
import 'package:otlop_app/core/errors/failure.dart';
import 'package:otlop_app/core/network/api_constant.dart';
import 'package:otlop_app/core/network/dio_factory.dart';
import 'package:otlop_app/feature/home/data/models/brand_model.dart';
import 'package:otlop_app/feature/home/data/models/category_model.dart';
import 'package:otlop_app/feature/home/data/models/product.dart';

class HomeRemoteDataSource {
  final Dio dio = DioFactory().dio;
  Future<Either<Failure, List<Product>>> getProduct({
    int? categoryId,
    int? brandId,
  }) async {
    List<Product> products = [];
    try {
      final response = await dio.get(
        ApiConstant.productEndPoint,
        queryParameters: {"categoryId": categoryId, "brandId": brandId},
      );
      for (Map<String, dynamic> element in response.data['data']) {
        products.add(Product.fromJson(element));
      }
      return Right(products);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, List<BrandModel>>> getBrand() async {
    List<BrandModel> brandNames =[];
    try {
      final response = await dio.get(ApiConstant.brandEndPoint);
      for (Map<String , dynamic> element in response.data) {
        brandNames.add(BrandModel.fromJson(element));
      }
      return Right(brandNames);
    } catch (e) {
      log(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, List<CategoryModel>>> getCategory() async {
    List<CategoryModel> categorylist = [];
    try {
      final response = await dio.get(ApiConstant.categoryEndPoint);
      for (Map<String, dynamic> element in response.data) {
        categorylist.add(CategoryModel.fromJson(element));
      }
      return Right(categorylist);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, void>> addCart({
    required int proudectId,
    required int qunatity,
  }) async {
    try {
      log('==================================');
      final Response response = await dio.post(
        ApiConstant.addCartEndPoint,
        data: {"productId": proudectId, "quantity": qunatity},
      );
      log('===================${response.data}');
      return Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
