import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:booksale/domain/entities/order.dart';
import 'package:meta/meta.dart';
import '../../../../data/repositories/order_repository_impl.dart';
part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final _repository = OrderRepositoryImpl();
  OrderBloc() : super(OrderInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<OrderCategorySelected>(_onCategorySelected);
    on<CancelOrder>(_onCancelOrder);
  }

  final List<String> _categoriesForOrder = [
    'Hamısı',
    'Aktiv',
    'Çatdırılıb',
    'Ləğv edilib',
  ];
  Future<void> _onLoadOrders(
      LoadOrders event,
      Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      List<Order> orders;
      try {
        orders = await _repository.getOrders();
        if (orders.isEmpty) orders = [];
      } catch (e) {

        orders = [];
      }
      emit(OrderLoaded(
        categories: _categoriesForOrder,
        allOrders: orders,
        filteredOrders: orders,
        selectedIndex: 0,
      ));
    } catch (e) {

      emit(OrderError(message: e.toString()));
    }
  }
  void _onCategorySelected(
      OrderCategorySelected event,
      Emitter<OrderState> emit) {
    if (state is OrderLoaded) {
      final current = state as OrderLoaded;
      final filtered = event.index == 0
          ? current.allOrders
          : current.allOrders
          .where((o) => o.status == _categoriesForOrder[event.index])
          .toList();
      emit(current.copyWith(
        selectedIndex: event.index,
        filteredOrders: filtered,
      ));
    }
  }

  Future<void> _onCancelOrder(
      CancelOrder event,
      Emitter<OrderState> emit) async {
    try {
      await _repository.cancelOrder(event.id as String);
      add(LoadOrders());
    } catch (e) {
      emit(OrderError(message: e.toString()));
    }
  }
}
