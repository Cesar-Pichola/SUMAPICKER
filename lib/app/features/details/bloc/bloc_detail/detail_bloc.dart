import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:picker/app/features/details/use_case/get_detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

@lazySingleton
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailUseCase getDetailUseCase;
  DetailBloc(this.getDetailUseCase) : super(DetailState()) {
    on<GetDetailEvent>((event, emit) async {
      emit(DetailState(status: const UILoading()));

      final result = await getDetailUseCase(
          params: RequestDetail(store: event.store, code: event.order));

      result.fold((error) {
        emit(DetailState(message: error, status: UIError(message: error)));
      }, (response) {
        emit(DetailState(products: response, status: const UISuccess()));
      });
    });
  }
}
