import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemStore extends StatelessWidget {
  final String name;
  const ItemStore({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 15.sp.clamp(14, 15),
                color: Colors.grey[900],
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(
            //   'Guatemala, Guatemala',
            //   style: TextStyle(
            //       fontSize: 12.sp.clamp(10, 12), color: Colors.grey[600]),
            // ),
          ],
        ),
      ],
    );
  }
}
