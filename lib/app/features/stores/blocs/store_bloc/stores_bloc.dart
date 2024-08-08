// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:picker/app/features/stores/use_cases/get_stores.dart';

part 'stores_event.dart';
part 'stores_state.dart';

@lazySingleton
class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final GetStoresUseCase getStoresUseCase;
  StoresBloc(this.getStoresUseCase) : super(StoresState()) {
    on<StoresEvent>((event, emit) async {
      emit(StoresState(status: const UILoading()));

      final result = await getStoresUseCase();

      result.fold((error) {
        emit(StoresState(status: const UILoading(), message: error));
      }, (response) {
        emit(StoresState(status: const UISuccess(), stores: response));
      });
    });
  }
}
