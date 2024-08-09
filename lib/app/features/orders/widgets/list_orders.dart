import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:picker/app/features/orders/blocs/orders_bloc/orders_bloc.dart';
import 'package:picker/app/features/orders/widgets/item_order.dart';
import 'package:picker/app/widgets/custom_error.dart';

class ListOrders extends StatelessWidget {
  final int store;
  const ListOrders({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
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
            child: ListView.separated(
              itemCount: state.orders!.length,
              separatorBuilder: (context, index) => Container(
                height: 10,
              ),
              itemBuilder: (context, index) {
                final item = state.orders![index];
                return ItemOrder(
                  store: store,
                  order: item,
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
