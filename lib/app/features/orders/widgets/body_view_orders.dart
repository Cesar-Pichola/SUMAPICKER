import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picker/app/features/orders/blocs/orders_bloc/orders_bloc.dart';
import 'package:picker/app/features/orders/widgets/list_orders.dart';
import 'package:picker/di/injection.dart';
import 'package:picker/gen/colors.gen.dart';
import 'package:tab_container/tab_container.dart';

class BodyOrdersView extends StatefulWidget {
  final int store;
  const BodyOrdersView({super.key, required this.store});

  @override
  State<BodyOrdersView> createState() => _BodyOrdersViewState();
}

class _BodyOrdersViewState extends State<BodyOrdersView> with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    _controller.addListener(tabHandler);
  }
  
   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  tabHandler(){
    if(_controller.indexIsChanging){
      if(_controller.index == 0){
        getIt<OrdersBloc>().add(GetOrdersStore(store: widget.store, type: 0));
      } else {
        getIt<OrdersBloc>().add(GetOrdersStore(store: widget.store, type: 3));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.dm),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30)
        ),
        color: AppColor.primary,
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
          Expanded(
              child: 
              TabContainer(
                controller: _controller,
                tabEdge: TabEdge.bottom,
                tabsStart: 0.3,
                tabsEnd: 0.7,
                tabMaxLength: 100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                tabBorderRadius: BorderRadius.circular(10),
                childPadding: EdgeInsets.symmetric(vertical: 5.dm, horizontal: 15.dm),
                selectedTextStyle: GoogleFonts.poppins(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                unselectedTextStyle: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                colors: [
                  Color(0xFFF5F5F5),
                  Color(0xFFF5F5F5),
                ],
                tabs: [
                  Text('Pedidos'),
                  Text('Historial')
                ],
                children: [
                  ListOrders(
                    store: widget.store,
                    type: 0,
                  ),
                  ListOrders(
                    store: widget.store,
                    type: 3,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
