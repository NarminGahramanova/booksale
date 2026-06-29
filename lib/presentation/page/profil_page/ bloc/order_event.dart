part of 'order_bloc.dart';


@immutable
sealed class OrderEvent {}
final class LoadOrders extends OrderEvent{}
final class OrderCategorySelected extends OrderEvent{
  final int index;

  OrderCategorySelected({required this.index});
}
final class CancelOrder extends OrderEvent{
  final int id;

  CancelOrder({required this.id});
}
final class RepeatOrder extends OrderEvent{
  final int id;

  RepeatOrder({required this.id});
}
