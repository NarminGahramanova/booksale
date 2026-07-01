import 'package:dio/dio.dart';
import '../../core/dio/endpoints.dart';
class AddressService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
  static Future<List<dynamic>> getAllAddresses() async {
    try {
      final response = await _dio.get(ApiEndpoints.addresses);
      if (response.statusCode == 200) {
        return response.data['data'] ?? [];
      }
      return [];
    } catch (e) {
      return [];
    }
  }
  static Future<dynamic> addAddress(Map<String, dynamic> address) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.addresses,
        data: address,
      );
      if (response.statusCode == 201) {
        return response.data['data'];
      }
      return null;
    } catch (e) {

      return null;
    }
  }
  static Future<dynamic> updateAddress(String id, Map<String, dynamic> address) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.address(id),
        data: address,
      );
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      return null;
    } catch (e) { return null;
    }
  }
  static Future<bool> deleteAddress(String id) async {
    try {
      final response = await _dio.delete(ApiEndpoints.address(id));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  static Future<bool> setDefaultAddress(String id) async {
    try {
      final response = await _dio.patch(
        ApiEndpoints.setDefaultAddress(id),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  static void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
}