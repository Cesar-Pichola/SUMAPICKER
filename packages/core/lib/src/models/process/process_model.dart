// ignore_for_file: public_member_api_docs, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'process_model.g.dart';

@JsonSerializable()
class ProcessResponse {
  ProcessResponse({
    required this.code,
    required this.indicator,
    required this.message,
  });

  factory ProcessResponse.fromJson(Map<String, dynamic> json) =>
      _$ProcessResponseFromJson(json);
  final int code;
  final String indicator;
  final String message;
  Map<String, dynamic> toJson() => _$ProcessResponseToJson(this);
}
