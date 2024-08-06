part of 'stores_bloc.dart';

sealed class StoresEvent {
  StoresEvent();
}

class GetStoresEvent extends StoresEvent {}
