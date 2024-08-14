import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/blocs/selected_order_bloc/selected_order_bloc.dart';
import 'package:picker/app/routes/app_router.dart';
import 'package:picker/di/injection.dart';

class ItemOrder extends StatelessWidget {
  final OrderEntity order;
  final int store;
  final int type;
  const ItemOrder({super.key, required this.order, required this.store, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getIt<SelectedOrderBloc>().add(SelectedOderEvt(order: order));

        context.navigateTo(DetailsRoute(
            name: order.client.name,
            order: order.code,
            status: order.status.toString(),
            type: type.toString(),
            store: store.toString()));
      },
      child: Container(
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
                  Row(
                    children: [
                      Text(
                        order.code,
                        style: GoogleFonts.poppins(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      (order.status == 2)
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Color(0xff07F22B),
                                  shape: BoxShape.circle),
                            )
                          : 
                        (order.status == 3) 
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 223, 9, 12),
                                  shape: BoxShape.circle),
                            )
                            : Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    color: Color(0xffF57C11),
                                    shape: BoxShape.circle),
                              )
                    ],
                  ),
                  Text(
                    order.client.name,
                    style: GoogleFonts.poppins(
                        color: Colors.grey[800],
                        fontSize: 13,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    order.date,
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
                  getIt<SelectedOrderBloc>().add(SelectedOderEvt(order: order));

                  context.navigateTo(DetailsRoute(
                      name: order.client.name,
                      order: order.code,
                      status: order.status.toString(),
                      type: type.toString(),
                      store: store.toString()));
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                )),
          ],
        )),
    );
  }
}
