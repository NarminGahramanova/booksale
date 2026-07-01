import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://kitab-bazari-api.onrender.com'),
  );

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<OtpVerifyRequested>(_onOtpVerifyRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await _dio.post(
        '/api/auth/login',
        data: {"email": event.email, "password": event.password},
      );
      emit(
        AuthSuccess(
          accessToken: response.data['accessToken'],
          user: response.data['user'],
        ),
      );
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Giriş alınmadı';
      emit(AuthFailure(message: message));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await _dio.post(
        '/api/auth/register',
        data: {
          "fullName": event.fullName,
          "email": event.email,
          "phone": event.phone,
          "password": event.password,
          "acceptTerms": true,
        },
      );
      emit(
        AuthSuccess(
          accessToken: response.data['accessToken'],
          user: response.data['user'],
        ),
      );
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Qeydiyyat alınmadı';
      emit(AuthFailure(message: message));
    }
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await _dio.post(
        '/api/auth/forgot-password',
        data: {"email": event.email},
      );

      emit(ForgotPasswordSuccess(devCode: response.data['devCode']));
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Xəta baş verdi';
      emit(AuthFailure(message: message));
    }
  }

  Future<void> _onOtpVerifyRequested(
    OtpVerifyRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
       final response = await _dio.post(
        '/api/auth/verify-otp',
        data: {"target": event.email, "code": event.otpCode},
      );
      emit(OtpVerifySuccess(resetToken: response.data['resetToken']));
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Kod yanlışdır';
      emit(AuthFailure(message: message));
    }
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _dio.post(
        '/api/auth/reset-password',
        data: {
          "email": event.email,
          "resetToken": event.resetToken,
          "newPassword": event.newPassword,
        },
      );
      emit(ResetPasswordSuccess());
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Şifrə yenilənmədi';
      emit(AuthFailure(message: message));
    }
  }
}
