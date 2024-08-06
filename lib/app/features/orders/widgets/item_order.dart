import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/routes/app_router.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0.0, 5),
                spreadRadius: 0.5)
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. 1025565',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Hector Ramirez',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 13,
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          IconButton(
              color: Colors.grey[700],
              iconSize: 18,
              onPressed: () {
                context.navigateTo(const DetailsRoute());
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ))
        ],
      ),
    );
  }
}
