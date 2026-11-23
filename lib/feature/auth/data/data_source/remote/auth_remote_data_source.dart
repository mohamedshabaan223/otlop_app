import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:otlop_app/core/cache/secure_storage.dart';
import 'package:otlop_app/core/errors/error_handler.dart';
import 'package:otlop_app/core/errors/failure.dart';
import 'package:otlop_app/core/network/api_constant.dart';
import 'package:otlop_app/core/network/dio_factory.dart';
import 'package:otlop_app/feature/auth/data/models/login_request.dart';
import 'package:otlop_app/feature/auth/data/models/register_request.dart';

class AuthRemoteDataSource {
  final Dio dio = DioFactory().dio;
  final SecureStorage secureStorage = SecureStorage();

  Future<Either<Failure, void>> register({
    required RegisterRequest register,
  }) async {
    try {
      await dio.post(ApiConstant.registerEndPoint, data: register.toJson());
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, void>> login({required LoginRequest login}) async {
    try {
      final Response response = await dio.post(
        ApiConstant.loginEndPoint,
        data: login.toJson(),
      );
      await secureStorage.saveAuthData(token: response.data['token']);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
