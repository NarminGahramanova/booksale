part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String accessToken;
  final Map<String, dynamic> user;

  AuthSuccess({required this.accessToken, required this.user});
}
class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}class ForgotPasswordSuccess extends AuthState {
  final String? devCode;
  ForgotPasswordSuccess({this.devCode});
}

class OtpVerifySuccess extends AuthState {
  final String resetToken;
  OtpVerifySuccess({required this.resetToken});
}

class ResetPasswordSuccess extends AuthState {}