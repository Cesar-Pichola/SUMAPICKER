import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/orders/widgets/item_order.dart';

class ListOrders extends StatelessWidget {
  const ListOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.dm),
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Container(
          height: 10,
        ),
        itemBuilder: (context, index) {
          return const ItemOrder();
        },
      ),
    );
  }
}
