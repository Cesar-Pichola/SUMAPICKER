import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:picker/app/features/details/use_case/process_order.dart';

part 'process_event.dart';
part 'process_state.dart';

@lazySingleton
class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final ProcessOrderUseCase processOrderUseCase;
  ProcessBloc(this.processOrderUseCase) : super(ProcessState()) {
    on<ProcessOrderEvent>((event, emit) async {
      emit(ProcessState(status: const UILoading()));
      final result = await processOrderUseCase(
          params: RequestProcess(store: event.store, code: event.order));
      result.fold((error) {
        emit(ProcessState(message: error, status: UIError(message: error)));
      }, (response) {
        emit(
            ProcessState(message: response.message, status: const UISuccess()));
      });
    });
  }
}
