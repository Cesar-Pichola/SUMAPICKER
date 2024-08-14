part of 'orders_bloc.dart';

sealed class OrdersEvent {}

class GetOrdersStore extends OrdersEvent {
  final int store;
  final int type;

  GetOrdersStore({required this.store, required this.type});
}
