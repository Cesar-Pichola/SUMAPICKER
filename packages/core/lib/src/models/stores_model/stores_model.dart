// ignore_for_file: public_member_api_docs, omit_local_variable_types
import 'package:json_annotation/json_annotation.dart';

part 'stores_model.g.dart';

@JsonSerializable()
class StoresResponse {
  final List<StoreItem> stores;
  final int code;
  final String indicator;
  final String message;

  StoresResponse({
    required this.stores,
    required this.code,
    required this.indicator,
    required this.message,
  });

  factory StoresResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
}

@JsonSerializable()
class StoreItem {
  final String code;
  final String name;

  StoreItem({
    required this.code,
    required this.name,
  });

  factory StoreItem.fromJson(Map<String, dynamic> json) =>
      _$StoreItemFromJson(json);
  Map<String, dynamic> toJson() => _$StoreItemToJson(this);
}
