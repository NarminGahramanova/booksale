part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class RegisterRequested extends AuthEvent {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  RegisterRequested({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class ForgotPasswordRequested extends AuthEvent {
  final String email;
  ForgotPasswordRequested({required this.email});
}

class OtpVerifyRequested extends AuthEvent {
  final String email;
  final String otpCode;
  OtpVerifyRequested({required this.email, required this.otpCode});
}

class ResetPasswordRequested extends AuthEvent {
  final String email;
  final String resetToken;
  final String newPassword;
  ResetPasswordRequested({
    required this.email,
    required this.resetToken,
    required this.newPassword,
  });
}