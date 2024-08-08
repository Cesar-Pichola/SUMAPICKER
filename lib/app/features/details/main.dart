import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/details/bloc/Process_bloc/process_bloc.dart';
import 'package:picker/app/features/details/bloc/bloc_detail/detail_bloc.dart';
import 'package:picker/app/features/details/widget/body_view_details.dart';
import 'package:picker/app/features/details/widget/header_view_details.dart';
import 'package:picker/di/injection.dart';
import 'package:picker/gen/colors.gen.dart';

@RoutePage()
class DetailsPage extends HookWidget {
  const DetailsPage(
      {@pathParam required this.order,
      @pathParam required this.name,
      @pathParam required this.status,
      @pathParam required this.store});

  final String order;
  final String name;
  final String store;
  final String status;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (int.parse(status) == 0) {
        print(status);
        print('sssssssss');
        getIt<ProcessBloc>()
            .add(ProcessOrderEvent(store: int.parse(store), order: order));
      }

      print(status);
      print('nnnnnn');

      getIt<DetailBloc>()
          .add(GetDetailEvent(store: int.parse(store), order: order));
      return null;
    }, [order]);
    return Scaffold(
      body: SafeArea(
        child: DetailsPageView(
          order: order,
          store: int.parse(store),
          code: order,
          nameClient: name,
        ),
      ),
    );
  }
}

class DetailsPageView extends StatelessWidget {
  final String code;
  final String nameClient;
  final int store;
  final String order;
  const DetailsPageView({
    super.key,
    required this.code,
    required this.nameClient,
    required this.store,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(color: AppColor.primary),
            child: HeaderViewDetails(
              code: code,
              nameClient: nameClient,
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            top: 100.h.clamp(100, 200),
            left: 0,
            right: 0,
            child: BodyDetailView(
              order: order,
              store: store,
            )),
      ],
    );
  }
}
