import 'package:booksale/domain/entities/order.dart';
import 'package:booksale/domain/repositories/order_repo.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepositoryImpl implements OrderRepo {
  final _datasource =OrderRemoteDatasource();
  @override
  Future<void> cancelOrder(String id) async {
    await _datasource.cancelOrder(id);
  }
@override
  Future<void> repeatOrder(String id) async {
    await _datasource.repeatOrder(id);
  }
  @override
  Future<Order?> getOrderById(String id) async {
    throw UnimplementedError();

  }

  @override
  Future<List<Order>> getOrders()  async{
    throw UnimplementedError();

  }

}
