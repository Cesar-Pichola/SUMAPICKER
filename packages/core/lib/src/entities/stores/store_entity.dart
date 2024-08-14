// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';

class StoreEntity {
  StoreEntity({required this.code, required this.name});

  factory StoreEntity.fromModel(StoreItem model) {
    return StoreEntity(
      code: model.code,
      name: model.name,
      // address: model.address.address,
    );
  }
  final int code;
  final String name;
  // final String address;
}
