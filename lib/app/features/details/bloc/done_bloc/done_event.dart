part of 'done_bloc.dart';

sealed class DoneEvent {}

class DoneOrder extends DoneEvent {
  final int store;
  final String order;

  DoneOrder({required this.store, required this.order});
}
