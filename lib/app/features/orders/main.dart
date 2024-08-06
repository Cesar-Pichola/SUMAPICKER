import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/orders/widgets/body_view_orders.dart';
import 'package:picker/app/features/orders/widgets/header_view_orders.dart';
import 'package:picker/gen/colors.gen.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  final String name;
  final String id;
  const OrdersPage(
      {@pathParam required this.id, @pathParam required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrdersPageView(
          nameStore: name,
        ),
      ),
    );
  }
}

class OrdersPageView extends StatelessWidget {
  final String nameStore;
  const OrdersPageView({super.key, required this.nameStore});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(color: AppColor.primary),
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
          child: const BodyOrdersView(),
        ),
      ],
    );
  }
}
