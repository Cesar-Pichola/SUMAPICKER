import 'package:flutter/material.dart';
import 'package:picker/gen/assets.gen.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Image.asset(
          AppAsset.images.error.path,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
