import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/orders/widgets/list_orders.dart';
import 'package:picker/app/widgets/custom_input/custom_input.dart';

class BodyOrdersView extends StatefulWidget {
  const BodyOrdersView({
    super.key,
  });

  @override
  State<BodyOrdersView> createState() => _BodyOrdersViewState();
}

class _BodyOrdersViewState extends State<BodyOrdersView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.dm, horizontal: 15.dm),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 5,
            offset: const Offset(0, 0.1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomInput(controller: controller),
          const Expanded(child: ListOrders())
        ],
      ),
    );
  }
}
