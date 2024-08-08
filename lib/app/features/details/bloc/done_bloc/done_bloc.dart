import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:picker/app/features/details/use_case/done_order.dart';

part 'done_event.dart';
part 'done_state.dart';

@lazySingleton
class DoneBloc extends Bloc<DoneEvent, DoneState> {
  final DoneOrderUseCase doneOrderUseCase;
  DoneBloc(this.doneOrderUseCase) : super(DoneState()) {
    on<DoneOrder>((event, emit) async {
      emit(DoneState(status: const UILoading()));
      final result = await doneOrderUseCase(
          params: RequestDone(store: event.store, code: event.order));
      result.fold((error) {
        emit(DoneState(message: error, status: UIError(message: error)));
      }, (response) {
        emit(DoneState(message: response.message, status: const UISuccess()));
      });
    });
  }
}
