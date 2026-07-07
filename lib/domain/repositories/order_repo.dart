import 'package:booksale/domain/entities/order.dart';

import '../../core/utils/result.dart';

abstract class OrderRepo {
  Future<Result<List<Order>>> getOrders();
  Future<Result<Order?>> getOrderById(String id);
  Future<Result<void>>cancelOrder(String id);
  Future<Result<void>> repeatOrder(String id);


}