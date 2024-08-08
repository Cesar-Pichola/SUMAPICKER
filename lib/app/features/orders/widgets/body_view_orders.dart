import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/orders/widgets/list_orders.dart';

class BodyOrdersView extends StatefulWidget {
  final int store;
  const BodyOrdersView({super.key, required this.store});

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
          // CustomInput(controller: controller),
          Expanded(
              child: ListOrders(
            store: widget.store,
          ))
        ],
      ),
    );
  }
}
