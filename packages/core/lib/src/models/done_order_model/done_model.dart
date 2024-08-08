// ignore_for_file: public_member_api_docs, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'done_model.g.dart';

@JsonSerializable()
class DoneResponse {
  DoneResponse({
    required this.code,
    required this.indicator,
    required this.message,
  });

  final int code;
  final String indicator;
  final String message;
  factory DoneResponse.fromJson(Map<String, dynamic> json) =>
      _$DoneResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoneResponseToJson(this);
}
