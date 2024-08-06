import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/details/widget/item_detail.dart';

class ListDetail extends StatelessWidget {
  const ListDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.dm),
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Container(
          height: 10,
        ),
        itemBuilder: (context, index) {
          return const ItemDetail();
        },
      ),
    );
  }
}
