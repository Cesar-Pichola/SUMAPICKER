import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picker/app/features/stores/widgets/store_list.dart';
import 'package:picker/gen/assets.gen.dart';
import 'package:picker/gen/colors.gen.dart';

@RoutePage()
class StoresPage extends StatelessWidget {
  const StoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(0)
                  ),
                  color:  AppColor.primary,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: 0,
                      child: BounceInDown(
                        child: Image.asset(
                          AppAsset.images.store.path,
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 180.h,
              left: 0,
              right: 0,
              child: const StoresList(),
            ),
          ],
        ),
      ),
    );
  }
}
