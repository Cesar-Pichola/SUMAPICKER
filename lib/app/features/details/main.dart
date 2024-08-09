// ignore_for_file: use_key_in_widget_constructors

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
  const DetailsPage({
    @pathParam required this.order,
    @pathParam required this.status,
    @pathParam required this.store,
    @pathParam required this.name,
  });

  final String order;
  final String store;
  final String status;
  final String name;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (int.parse(status) == 1) {
        getIt<ProcessBloc>()
            .add(ProcessOrderEvent(store: int.parse(store), order: order));
      }
      getIt<DetailBloc>()
          .add(GetDetailEvent(store: int.parse(store), order: order));
      return null;
    }, [order]);
    return Scaffold(
      body: SafeArea(
        child: DetailsPageView(
          nameClient: name,
          order: order,
          store: int.parse(store),
          code: order,
        ),
      ),
    );
  }
}

class DetailsPageView extends StatelessWidget {
  final String nameClient;
  final String code;
  final int store;
  final String order;
  const DetailsPageView(
      {super.key,
      required this.code,
      required this.store,
      required this.order,
      required this.nameClient});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(color: AppColor.primary),
            child: HeaderViewDetails(
              store: store,
              nameClient: nameClient,
              code: code,
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
