import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:picker/app/features/orders/use_cases/get_orders.dart';

part 'orders_event.dart';
part 'orders_state.dart';

@lazySingleton
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  OrdersBloc(this.getOrdersUseCase) : super(OrdersState()) {
    on<GetOrdersStore>((event, emit) async {
      emit(OrdersState(status: const UILoading()));
      final result = await getOrdersUseCase(params: event.store);
      result.fold((error) {
        emit(OrdersState(message: error, status: UIError(message: error)));
      }, (response) {
        emit(OrdersState(status: const UISuccess(), orders: response));
      });
    });
  }
}
