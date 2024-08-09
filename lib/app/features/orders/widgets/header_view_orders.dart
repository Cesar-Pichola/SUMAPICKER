import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/gen/assets.gen.dart';

class HeaderViewOrders extends StatelessWidget {
  final String name;
  const HeaderViewOrders({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -50,
          top: -100,
          child: BounceInLeft(
            child: Image.asset(
              AppAsset.images.motoorder.path,
              width: 300,
              height: 300,
            ),
          ),
        ),
        Positioned(
            child: Container(
          margin: const EdgeInsets.only(left: 20, top: 15),
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Pedidos',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              FadeIn(
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
