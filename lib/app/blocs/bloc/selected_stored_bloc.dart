// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

part 'selected_stored_event.dart';
part 'selected_stored_state.dart';

@lazySingleton
class SelectedStoredBloc
    extends Bloc<SelectedStoredEvent, SelectedStoredState> {
  SelectedStoredBloc() : super(SelectedStoredState()) {
    on<SelectedStoreEnv>((event, emit) {
      emit(SelectedStoredState(id: event.id, name: event.name));
    });
  }
}
