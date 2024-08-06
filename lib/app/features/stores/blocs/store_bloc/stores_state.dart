part of 'stores_bloc.dart';

class StoresState {
  final List<StoreEntity>? stores;
  final String? message;
  final UIStatus? status;

  StoresState({this.stores, this.message, this.status = const UIInitial()});
}
