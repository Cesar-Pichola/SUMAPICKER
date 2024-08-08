import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/details/widget/item_detail.dart';

class ListDetail extends StatelessWidget {
  final List<ProductEntity> products;
  const ListDetail({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.dm),
      child: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => Container(
          height: 10,
        ),
        itemBuilder: (context, index) {
          final item = products[index];
          return ItemDetail(
            product: item,
          );
        },
      ),
    );
  }
}
