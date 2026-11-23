part of 'auth_cubit.dart';

abstract class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthLoadingState extends AuthCubitState {}

final class AuthSuccessState extends AuthCubitState {}

final class AuthErrorState extends AuthCubitState {
  final String errMessage;

  new({required this.errMessage});
}
