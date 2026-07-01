import 'package:booksale/core/dio/api_client.dart';
import 'package:booksale/data/models/order_model.dart';

class OrderRemoteDatasource {
  final _dio = ApiClient().dio;

  Future<List<OrderModel>> getOrders(String id) async {
    final res = await _dio.get('/api/orders');
    final List items = res.data['items'];
    return items
        .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> cancelOrder(String id) async {
    await _dio.post('/api/orders/$id/cancel');
  }

  Future<void> repeatOrder(String id) async {
    await _dio.post('/api/orders/$id/repeat');
  }
}
