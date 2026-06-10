
import '../../core/dio/api_client.dart';
import '../../core/dio/endpoints.dart';
import '../../core/storage/secure_storage.dart';

class AuthRemoteDataSource {
  final _api = ApiClient();
  final _storage = SecureStorage();

  Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) async {
    final res = await _api.dio.post(ApiEndpoints.register, data: {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'acceptTerms': true,
    });
    await _saveSession(res.data);
    return res.data['user'];
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final res = await _api.dio.post(ApiEndpoints.login, data: {
      'email': email,
      'password': password,
    });
    await _saveSession(res.data);
    return res.data['user'];
  }

  Future<void> logout() async {
    try {
      final refresh = await _storage.getRefreshToken();
      if (refresh != null) {
        await _api.dio.post(ApiEndpoints.logout, data: {'refreshToken': refresh});
      }
    } catch (_) {}
    await _storage.clear();
  }

  Future<void> forgotPassword(String email) async {
    await _api.dio.post(ApiEndpoints.forgotPassword, data: {'email': email});
  }

  Future<String> verifyOtp(String email, String code) async {
    final res = await _api.dio.post(ApiEndpoints.verifyOtp, data: {
      'target': email,
      'code': code,
      'purpose': 'PasswordReset',
    });
    return res.data['resetToken'] as String;
  }

  Future<void> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    await _api.dio.post(ApiEndpoints.resetPassword, data: {
      'email': email,
      'resetToken': resetToken,
      'newPassword': newPassword,
    });
  }

  Future<void> _saveSession(Map<String, dynamic> data) async {
    await _storage.saveTokens(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
    await _storage.saveUserId(data['user']['id']);
  }
}