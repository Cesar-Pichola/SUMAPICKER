import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/orders/blocs/orders_bloc/orders_bloc.dart';
import 'package:picker/app/features/orders/widgets/body_view_orders.dart';
import 'package:picker/app/features/orders/widgets/header_view_orders.dart';
import 'package:picker/di/injection.dart';
import 'package:picker/gen/colors.gen.dart';

@RoutePage()
class OrdersPage extends HookWidget {
  final String name;
  final String id;
  // ignore: use_key_in_widget_constructors
  const OrdersPage(
      {@pathParam required this.id, @pathParam required this.name});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      getIt<OrdersBloc>().add(GetOrdersStore(store: int.parse(id), type: 0));
      return null;
    }, [id]);
    return Scaffold(
      body: SafeArea(
        child: OrdersPageView(
          store: int.parse(id),
          nameStore: name,
        ),
      ),
    );
  }
}

class OrdersPageView extends StatelessWidget {
  final String nameStore;
  final int store;
  const OrdersPageView(
      {super.key, required this.nameStore, required this.store});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            // decoration: const BoxDecoration(color: Colors.white),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color:  AppColor.primary,
            ),
            child: HeaderViewOrders(
              name: nameStore,
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            top: 95.h.clamp(100, 200),
            left: 0,
            right: 0,
            child: BodyOrdersView(
              store: store,
            )),
      ],
    );
  }
}
