part of 'orders_bloc.dart';

class OrdersState {
  final List<OrderEntity>? orders;
  final List<OrderEntity>? history;
  final UIStatus? status;
  final String? message;

  OrdersState({this.orders, this.history, this.status = const UIInitial(), this.message});
}
