import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/details/widget/body_view_details.dart';
import 'package:picker/app/features/details/widget/header_view_details.dart';
import 'package:picker/gen/colors.gen.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DetailsPageView(),
      ),
    );
  }
}

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(color: AppColor.primary),
            child: const HeaderViewDetails(),
          ),
        ),
        Positioned(
            bottom: 0,
            top: 100.h.clamp(100, 200),
            left: 0,
            right: 0,
            child: const BodyDetailView()),
      ],
    );
  }
}
