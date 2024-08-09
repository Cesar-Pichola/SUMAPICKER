part of 'selected_order_bloc.dart';

sealed class SelectedOrderEvent {}

class SelectedOderEvt extends SelectedOrderEvent {
  final OrderEntity order;

  SelectedOderEvt({required this.order});
}
