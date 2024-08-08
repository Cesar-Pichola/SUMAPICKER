// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoneResponse _$DoneResponseFromJson(Map<String, dynamic> json) => DoneResponse(
      code: (json['code'] as num).toInt(),
      indicator: json['indicator'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DoneResponseToJson(DoneResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'indicator': instance.indicator,
      'message': instance.message,
    };
