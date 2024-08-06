import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/features/details/widget/list_detail.dart';
import 'package:picker/app/widgets/custom_buttoms/custom_outline_buttom.dart';
import 'package:picker/app/widgets/custom_input/custom_input.dart';
// import 'package:picker/app/widgets/custom_input/custom_input.dart';

class BodyDetailView extends StatefulWidget {
  const BodyDetailView({
    super.key,
  });

  @override
  State<BodyDetailView> createState() => _BodyOrdersViewState();
}

class _BodyOrdersViewState extends State<BodyDetailView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 13.dm.clamp(10, 13), horizontal: 15.dm),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 5,
            offset: const Offset(0, 0.1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomInput(controller: controller),
          const Expanded(child: ListDetail()),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.dm),
                padding: EdgeInsets.all(8.dm.clamp(5, 8)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Llevando 4 productos',
                      style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontSize: 12.sp.clamp(10, 12),
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: GoogleFonts.poppins(
                              color: Colors.grey[900],
                              fontSize: 14.sp.clamp(12, 14),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Q 10,000.00',
                          style: GoogleFonts.poppins(
                              color: Colors.grey[900],
                              fontSize: 14.sp.clamp(12, 14),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomOutlineButtom(
                  onPressed: () {},
                  textBtn: 'Completar Pedido',
                  width: 250,
                  height: 35),
            ],
          )
        ],
      ),
    );
  }
}


/* 
       Text(
                'Llevando 4 productos',
                style: GoogleFonts.poppins(
                    color: Colors.grey[800],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
 */