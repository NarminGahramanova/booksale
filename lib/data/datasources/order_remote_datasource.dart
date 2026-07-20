import 'package:dio/dio.dart';
import 'package:booksale/data/models/order_model.dart';

abstract class OrderRemoteDatasource {
  Future<List<OrderModel>> getOrders(String id);
  Future<void> cancelOrder(String id);
  Future<void> repeatOrder(String id);
}

class OrderRemoteDatasourceImpl implements OrderRemoteDatasource {
  final Dio dio;

  OrderRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<OrderModel>> getOrders(String id) async {
    final res = await dio.get('/api/orders');
    final List items = res.data['items'];
    return items
        .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> cancelOrder(String id) async {
    await dio.post('/api/orders/$id/cancel');
  }

  @override
  Future<void> repeatOrder(String id) async {
    await dio.post('/api/orders/$id/repeat');
  }
}