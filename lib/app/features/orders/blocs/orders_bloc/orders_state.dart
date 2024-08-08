part of 'orders_bloc.dart';

class OrdersState {
  final List<OrderEntity>? orders;
  final UIStatus? status;
  final String? message;

  OrdersState({this.orders, this.status = const UIInitial(), this.message});
}
