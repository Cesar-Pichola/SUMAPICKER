import 'package:core/vendors/vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/blocs/selected_order_bloc/selected_order_bloc.dart';

class ClientInfo extends StatelessWidget {
  const ClientInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedOrderBloc, SelectedOrderState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.dm),
                  child: Text(
                    state.order?.client.name ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.dm),
              child: Text(
                'Nit. ${state.order?.billing.nit ?? ''}',
                style: GoogleFonts.poppins(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Text(
              'No. ${state.order?.code ?? ''}',
              style: GoogleFonts.poppins(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              state.order?.date ?? '',
              style: GoogleFonts.poppins(
                  color: Colors.grey[800],
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.dm),
              child: Text(
                'receptor',
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.grey[800],
                ),
                Text(
                  '  ${state.order?.receptor.prefix}  ',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  '${state.order?.receptor.phone}',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
