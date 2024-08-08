part of 'detail_bloc.dart';

sealed class DetailEvent {}

class GetDetailEvent extends DetailEvent {
  final int store;
  final String order;

  GetDetailEvent({required this.store, required this.order});
}
