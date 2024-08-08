import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetail extends StatelessWidget {
  final ProductEntity product;
  const ItemDetail({
    super.key,
    required this.product,
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
          Image.network(
            product.image.url,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Cantidad : ${product.amount}',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Q ${product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
