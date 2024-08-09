// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/features/details/bloc/done_bloc/done_bloc.dart';
import 'package:picker/app/features/details/widget/client_info.dart';
import 'package:picker/app/features/orders/blocs/orders_bloc/orders_bloc.dart';
import 'package:picker/di/injection.dart';
import 'package:picker/gen/assets.gen.dart';

class HeaderViewDetails extends StatelessWidget {
  final int store;
  final String code;
  final String nameClient;
  const HeaderViewDetails(
      {super.key,
      required this.code,
      required this.nameClient,
      required this.store});

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
                  BlocListener<DoneBloc, DoneState>(
                    listener: (context, state) {
                      if (state.status is UISuccess) {
                        context.router.pop();
                        getIt<OrdersBloc>().add(GetOrdersStore(store: store));
                      }
                    },
                    child: IconButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 18,
                        )),
                  ),
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
                          _showModal(context, const ClientInfo());
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
        padding: EdgeInsets.only(top: 30.dm, left: 20.dm),
        height: size.height * 05,
        width: size.width,
        child: child,
      );
    },
  );
}
