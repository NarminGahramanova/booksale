import 'package:booksale/domain/entities/order.dart';

abstract class OrderRepo {
  Future<List<Order>> getOrders();
  Future<Order?> getOrderById(String id);
  Future<void> cancelOrder(String id);
  Future<void> repeatOrder(String id);


}