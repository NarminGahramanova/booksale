import 'package:booksale/core/error/failures.dart';
import 'package:booksale/core/utils/result.dart';
import 'package:booksale/domain/entities/order.dart';
import 'package:booksale/domain/repositories/order_repo.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepositoryImpl implements OrderRepo {
  final _datasource = OrderRemoteDatasource();

  @override
  Future<Result<void>> cancelOrder(String id) async {
    try {
      await _datasource.cancelOrder(id);
      return const Success(null);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

  @override
  Future<Result<void>> repeatOrder(String id) async {
    try {
      await _datasource.repeatOrder(id);
      return const Success(null);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

  @override
  Future<Result<List<Order>>> getOrders() async {
    try {
      final orders = await _datasource.getOrders('');
      return Success(orders);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

  @override
  Future<Result<Order?>> getOrderById(String id) async {
    try {
      final orders = await _datasource.getOrders('');
      final order = orders.where((o) => o.id == id).firstOrNull;
      return Success(order);
    } catch (e) {
      return Error(CacheFailure());
    }
  }
}