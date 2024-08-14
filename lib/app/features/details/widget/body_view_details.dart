import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:picker/app/features/details/bloc/bloc_detail/detail_bloc.dart';
import 'package:picker/app/features/details/bloc/done_bloc/done_bloc.dart';
import 'package:picker/app/features/details/widget/list_detail.dart';
import 'package:picker/app/widgets/custom_buttoms/custom_outline_buttom.dart';
import 'package:picker/app/widgets/custom_error.dart';
import 'package:picker/di/injection.dart';
// import 'package:picker/app/widgets/custom_input/custom_input.dart';

class BodyDetailView extends StatefulWidget {
  final int store;
  final int type;
  final String order;
  const BodyDetailView({
    super.key,
    required this.store,
    required this.type,
    required this.order,
  });

  @override
  State<BodyDetailView> createState() => _BodyOrdersViewState();
}

class _BodyOrdersViewState extends State<BodyDetailView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double getSubtotal(List<ProductEntity> products) {
      double subtotal = 0;
      for (var item in products) {
        subtotal += item.price;
      }
      return subtotal;
    }

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
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state.status is UILoading) {
              return const SpinKitThreeBounce(
                color: Colors.red,
                size: 40.0,
              );
            }
            if (state.status is UIError) {
              return const CustomError();
            }
            if (state.status is UISuccess) {
              return Column(
                children: [
                  // CustomInput(controller: controller),
                  Expanded(
                      child: ListDetail(
                    products: state.products!,
                  )),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.dm),
                        padding: EdgeInsets.all(8.dm.clamp(5, 8)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'El pedido contiene ${state.products!.length} producto(s)',
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
                                  'Q ${getSubtotal(state.products!).toStringAsFixed(2)}',
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
                      widget.type == 0?
                      CustomOutlineButtom(
                          onPressed: () {
                            PanaraConfirmDialog.show(
                              context,
                              title: "Completar Pedido",
                              message:
                                  "¿Estás seguro de completar este pedido?",
                              confirmButtonText: "Confirmar",
                              cancelButtonText: "Cancelar",
                              onTapCancel: () {
                                Navigator.pop(context);
                              },
                              onTapConfirm: () {
                                getIt<DoneBloc>().add(DoneOrder(
                                    store: widget.store, order: widget.order));
                                Navigator.pop(context);
                              },
                              panaraDialogType: PanaraDialogType.error,
                              barrierDismissible:
                                  false, // optional parameter (default is true)
                            );
                          },
                          textBtn: 'Completar Pedido',
                          width: 250,
                          height: 35) : const SizedBox()
                    ],
                  )
                ],
              );
            }
            return Container();
          },
        ));
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