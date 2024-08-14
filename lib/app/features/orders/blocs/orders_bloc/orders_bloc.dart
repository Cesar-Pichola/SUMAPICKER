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
      final result = await getOrdersUseCase(params: RequestOrders(store: event.store, type: event.type));
      result.fold((error) {
        emit(OrdersState(message: error, status: UIError(message: error)));
      }, (response) {
        if(event.type == 0){
          emit(OrdersState(status: const UISuccess(), orders: response));
        } else{
          emit(OrdersState(status: const UISuccess(), history: response));
        }
      });
    });
  }
}
