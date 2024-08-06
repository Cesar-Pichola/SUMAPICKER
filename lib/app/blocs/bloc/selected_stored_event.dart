part of 'selected_stored_bloc.dart';

sealed class SelectedStoredEvent {}

class SelectedStoreEnv extends SelectedStoredEvent {
  final int id;
  final String name;

  SelectedStoreEnv({required this.id, required this.name});
}
