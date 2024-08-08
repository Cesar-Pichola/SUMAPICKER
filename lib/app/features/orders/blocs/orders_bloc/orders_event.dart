part of 'orders_bloc.dart';

sealed class OrdersEvent {}

class GetOrdersStore extends OrdersEvent {
  final int store;

  GetOrdersStore({required this.store});
}
