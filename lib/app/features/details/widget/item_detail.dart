import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
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
          Image.network(
            'https://sistemas.gta.com.gt:8015/msfapp/Gtaimagenes/ImagePro/productos/101011.jpg',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agua pura salvavidas manzana',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Cantidad : 5',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Q 200.00',
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
