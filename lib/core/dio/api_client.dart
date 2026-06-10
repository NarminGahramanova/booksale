import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../storage/secure_storage.dart';
import 'api_exception.dart';
import 'endpoints.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  late final Dio dio;
  final SecureStorage _storage = SecureStorage();
  bool _isRefreshing = false;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.getAccessToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401 && !_isRefreshing) {
            _isRefreshing = true;
            try {
              final refreshToken = await _storage.getRefreshToken();
              if (refreshToken != null) {
                final res = await Dio().post(
                  '${ApiEndpoints.baseUrl}${ApiEndpoints.refresh}',
                  data: {'refreshToken': refreshToken},
                );
                await _storage.saveTokens(
                  accessToken: res.data['accessToken'],
                  refreshToken: res.data['refreshToken'],
                );
                final clonedRequest = await dio.fetch(
                  e.requestOptions
                    ..headers['Authorization'] =
                        'Bearer ${res.data['accessToken']}',
                );
                _isRefreshing = false;
                return handler.resolve(clonedRequest);
              }
            } catch (_) {
              await _storage.clear();
            }
            _isRefreshing = false;
          }
          final data = e.response?.data;
          if (data is Map && data['error'] != null) {
            return handler.reject(
              DioException(
                requestOptions: e.requestOptions,
                response: e.response,
                error: ApiException(
                  statusCode: e.response?.statusCode ?? 500,
                  code: data['error']['code'] ?? 'UNKNOWN',
                  message: data['error']['message'] ?? 'Naməlum xəta',
                ),
              ),
            );
          }
          handler.next(e);
        },
      ),
    );
  }
}
