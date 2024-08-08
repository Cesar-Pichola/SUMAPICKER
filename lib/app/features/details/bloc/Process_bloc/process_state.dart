part of 'process_bloc.dart';

class ProcessState {
  final UIStatus? status;
  final String? message;

  ProcessState({this.status = const UIInitial(), this.message});
}
