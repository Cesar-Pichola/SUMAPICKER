// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessResponse _$ProcessResponseFromJson(Map<String, dynamic> json) =>
    ProcessResponse(
      code: (json['code'] as num).toInt(),
      indicator: json['indicator'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ProcessResponseToJson(ProcessResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'indicator': instance.indicator,
      'message': instance.message,
    };
