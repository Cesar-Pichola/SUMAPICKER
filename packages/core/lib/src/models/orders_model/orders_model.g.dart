// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      code: (json['code'] as num).toInt(),
      indicator: json['indicator'] as String,
      message: json['message'] as String,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'indicator': instance.indicator,
      'message': instance.message,
      'orders': instance.orders,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      code: json['code'] as String,
      status: (json['status'] as num).toInt(),
      date: json['date'] as String,
      client: ClientOrder.fromJson(json['client'] as Map<String, dynamic>),
      receptor:
          ReceptorOrder.fromJson(json['receptor'] as Map<String, dynamic>),
      billing: BillingOrder.fromJson(json['billing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'date': instance.date,
      'client': instance.client,
      'receptor': instance.receptor,
      'billing': instance.billing,
    };

ClientOrder _$ClientOrderFromJson(Map<String, dynamic> json) => ClientOrder(
      code: (json['code'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ClientOrderToJson(ClientOrder instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

ReceptorOrder _$ReceptorOrderFromJson(Map<String, dynamic> json) =>
    ReceptorOrder(
      prefix: json['prefix'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ReceptorOrderToJson(ReceptorOrder instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'phone': instance.phone,
    };

BillingOrder _$BillingOrderFromJson(Map<String, dynamic> json) => BillingOrder(
      nit: json['nit'] as String,
    );

Map<String, dynamic> _$BillingOrderToJson(BillingOrder instance) =>
    <String, dynamic>{
      'nit': instance.nit,
    };
