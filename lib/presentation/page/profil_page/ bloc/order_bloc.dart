import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:booksale/core/utils/result.dart';
import 'package:booksale/domain/entities/order.dart';
import 'package:meta/meta.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../domain/repositories/order_repo.dart';
part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final _repository = sl<OrderRepo>();
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
      LoadOrders event, Emitter<OrderState> emit) async {
    emit(OrderLoading());

    final result = await _repository.getOrders();

    switch (result) {
      case Success(data: final orders):
        emit(OrderLoaded(
          categories: _categoriesForOrder,
          allOrders: orders,
          filteredOrders: orders,
          selectedIndex: 0,
        ));
      case Error():
        emit(OrderLoaded(
          categories: _categoriesForOrder,
          allOrders: const [],
          filteredOrders: const [],
          selectedIndex: 0,
        ));
    }
  }

  void _onCategorySelected(
      OrderCategorySelected event, Emitter<OrderState> emit) {
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
      CancelOrder event, Emitter<OrderState> emit) async {
    final result = await _repository.cancelOrder(event.id.toString());

    switch (result) {
      case Success():
        add(LoadOrders());
      case Error(failure: final failure):
        emit(OrderError(message: failure.message));
    }
  }
}