// ignore_for_file: always_put_required_named_parameters_first

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/gen/colors.gen.dart';

class CustomOutlineButtom extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String textBtn;
  final Color? colorText;
  final bool? enable;
  final Color? colorBorder;

  const CustomOutlineButtom({
    super.key,
    required this.onPressed,
    this.colorText = Colors.white,
    this.colorBorder,
    required this.textBtn,
    required this.width,
    required this.height,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: colorBorder != null
                      ? BorderSide(color: colorBorder ?? Colors.transparent)
                      : BorderSide.none,
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(AppColor.primary),
            ),
            onPressed: enable! ? onPressed : null,
            child: Center(
              child: AutoSizeText(
                textBtn,
                maxFontSize: 14,
                minFontSize: 8,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
