part of 'done_bloc.dart';

class DoneState {
  final UIStatus? status;
  final String? message;

  DoneState({this.status = const UIInitial(), this.message});
}
