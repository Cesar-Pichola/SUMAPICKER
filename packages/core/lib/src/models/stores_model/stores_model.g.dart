// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoresResponse _$StoresResponseFromJson(Map<String, dynamic> json) =>
    StoresResponse(
      stores: (json['stores'] as List<dynamic>)
          .map((e) => StoreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
      indicator: json['indicator'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$StoresResponseToJson(StoresResponse instance) =>
    <String, dynamic>{
      'stores': instance.stores,
      'code': instance.code,
      'indicator': instance.indicator,
      'message': instance.message,
    };

StoreItem _$StoreItemFromJson(Map<String, dynamic> json) => StoreItem(
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$StoreItemToJson(StoreItem instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
