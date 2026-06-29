part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderLoaded extends OrderState {
  final List<String> categories;
  final List<Order> allOrders;
  final List<Order> filteredOrders;
  final int selectedIndex;

  OrderLoaded({
    required this.categories,
    required this.allOrders,
    required this.filteredOrders,
    required this.selectedIndex,
  });

  OrderLoaded copyWith({
    List<String>? categories,
    List<Order>? filteredOrders,
    List<Order>? allOrders,
    int? selectedIndex,
  }) {
    return OrderLoaded(
      categories: categories ?? this.categories,
      allOrders: allOrders ?? this.allOrders,
      filteredOrders: filteredOrders ?? this.filteredOrders,
      selectedIndex: selectedIndex ?? this.selectedIndex,

    );
  }
}

final class OrderError extends OrderState {
  final String message;

  OrderError({required this.message});
}
