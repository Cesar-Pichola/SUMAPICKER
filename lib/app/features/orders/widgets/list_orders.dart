import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:picker/app/features/orders/blocs/orders_bloc/orders_bloc.dart';
import 'package:picker/app/features/orders/widgets/item_order.dart';
import 'package:picker/app/widgets/custom_error.dart';
import 'package:picker/di/injection.dart';

class ListOrders extends StatelessWidget {
  final int store;
  final int type;
  const ListOrders({super.key, required this.store, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        Future<void> _pullRefresh() async {
          getIt<OrdersBloc>().add(GetOrdersStore(store: store, type: type));
        }

        if (state.status is UILoading) {
          return const SpinKitThreeBounce(
            color: Colors.red,
            size: 40.0,
          );
        }
        if (state.status is UIError) {
          return const CustomError();
        }
        if (state.status is UISuccess) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.dm),
            child: RefreshIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
              onRefresh: _pullRefresh,
              child: ListView.separated(
                itemCount: type == 0 ? (state.orders?.length ?? 0) : (state.history?.length ?? 0),
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  final item = type == 0 ? state.orders![index] : state.history![index];
                  return ItemOrder(
                    store: store,
                    order: item,
                    type: type,
                  );
                },
              ),
            )
          );
        }

        return Container();
      },
    );
  }
}
