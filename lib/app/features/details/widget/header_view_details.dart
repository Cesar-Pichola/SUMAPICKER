import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/gen/assets.gen.dart';

class HeaderViewDetails extends StatelessWidget {
  final String code;
  final String nameClient;
  const HeaderViewDetails({
    super.key,
    required this.code,
    required this.nameClient,
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
                          'No. $code',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      FadeIn(
                        child: Text(
                          nameClient,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showModal(
                              context,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nameClient,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ));
                        },
                        child: Text(
                          'Ver mas',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontWeight: FontWeight.w300),
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

void _showModal(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(15.dm),
        height: size.height * 05,
        child: Center(child: child),
      );
    },
  );
}
