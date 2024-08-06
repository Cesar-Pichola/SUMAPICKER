import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/routes/app_router.dart';
import 'package:picker/gen/assets.gen.dart';

class HeaderViewDetails extends StatelessWidget {
  const HeaderViewDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -50,
          top: -65,
          child: BounceInRight(
            child: Image.asset(
              AppAsset.images.orders.path,
              width: 300,
              height: 300,
            ),
          ),
        ),
        Positioned(
            child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 18,
                      )),
                  Text(
                    'Detalle',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeIn(
                        child: Text(
                          'No. 26604291',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      FadeIn(
                        child: Text(
                          'Hector Ramírez',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )),
      ],
    );
  }
}
