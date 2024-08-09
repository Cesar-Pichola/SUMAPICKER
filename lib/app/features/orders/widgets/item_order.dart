import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/routes/app_router.dart';

class ItemOrder extends StatelessWidget {
  final String code;
  final String date;
  final Client client;
  final int store;
  final int status;
  const ItemOrder(
      {super.key,
      required this.code,
      required this.date,
      required this.status,
      required this.client,
      required this.store});

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
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          code,
                          style: GoogleFonts.poppins(
                              color: Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        (status == 1)
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    color: Color(0xffF57C11),
                                    shape: BoxShape.circle),
                              )
                            : Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    color: Color(0xff07F22B),
                                    shape: BoxShape.circle),
                              )
                      ],
                    ),
                    Text(
                      client.name,
                      style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontSize: 13,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      date,
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
                    context.navigateTo(DetailsRoute(
                        name: client.name,
                        order: code,
                        status: status.toString(),
                        store: store.toString()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ))
            ],
          ),
        ));
  }
}
