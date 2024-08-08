// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:core/core.dart';

class DoneEntity {
  DoneEntity({
    required this.code,
    required this.indicator,
    required this.message,
  });

  final int code;
  final String indicator;
  final String message;

  factory DoneEntity.fromModel(DoneResponse model) {
    return DoneEntity(
      code: model.code,
      indicator: model.indicator,
      message: model.message,
    );
  }
}
