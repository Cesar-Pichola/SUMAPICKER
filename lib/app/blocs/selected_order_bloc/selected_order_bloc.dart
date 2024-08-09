import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

part 'selected_order_event.dart';
part 'selected_order_state.dart';

@lazySingleton
class SelectedOrderBloc extends Bloc<SelectedOrderEvent, SelectedOrderState> {
  SelectedOrderBloc() : super(SelectedOrderState()) {
    on<SelectedOderEvt>((event, emit) {
      emit(SelectedOrderState(order: event.order));
    });
  }
}
