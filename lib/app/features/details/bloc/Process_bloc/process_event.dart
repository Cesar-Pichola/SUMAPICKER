part of 'process_bloc.dart';

class ProcessEvent {}

class ProcessOrderEvent extends ProcessEvent {
  final int store;
  final String order;

  ProcessOrderEvent({required this.store, required this.order});
}
