import 'dart:io';

import 'package:core/vendors/vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:picker/app/blocs/selected_order_bloc/selected_order_bloc.dart';
import 'package:picker/app/widgets/custom_buttoms/custom_outline_buttom.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientInfo extends StatelessWidget {
  const ClientInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedOrderBloc, SelectedOrderState>(
      builder: (context, state) {
        _whatsapp() async {
          var whatsappUrl = Uri.parse("whatsapp://send?phone=${state.order?.receptor.prefix}${state.order?.receptor.phone}");
          try {
            launchUrl(whatsappUrl);
          } catch (e) {
            debugPrint(e.toString());
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.dm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pedido ${state.order?.code ?? ''}',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                          state.order?.date ?? '',
                          style: GoogleFonts.poppins(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cliente: ${state.order?.client.name ?? ''}',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                    'NIT: ${state.order?.billing.nit ?? ''}',
                    style: GoogleFonts.poppins(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                ),
                Text(
                    'Teléfono: ${state.order?.receptor.prefix ?? ''} ${state.order?.receptor.phone}',
                    style: GoogleFonts.poppins(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.dm),
                  child: Center(
                    child: CustomOutlineButtom(
                      onPressed: _whatsapp,
                      textBtn: 'Contactar por WhatsApp',
                      width: 250,
                      height: 35
                    ),
                  )
                )
              ]
            ),
          ],
        );
      },
    );
  }
}
