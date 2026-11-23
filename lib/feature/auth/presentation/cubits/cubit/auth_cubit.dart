import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:otlop_app/feature/auth/data/models/login_request.dart';
import 'package:otlop_app/feature/auth/data/models/register_request.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  Future<void> login({required LoginRequest login}) async {
    emit(AuthLoadingState());
    final response = await authRemoteDataSource.login(login: login);
    response.fold(
      (error) => emit(AuthErrorState(errMessage: error.message)),
      (value) => emit(AuthSuccessState()),
    );
  }

  Future<void> register({required RegisterRequest register}) async {
    emit(AuthLoadingState());
    final response = await authRemoteDataSource.register(register: register);
    response.fold(
      (error) => emit(AuthErrorState(errMessage: error.message)),
      (value) => emit(AuthSuccessState()),
    );
  }
}
