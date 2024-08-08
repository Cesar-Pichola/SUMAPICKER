// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'orders_model.g.dart';

@JsonSerializable()
class OrdersResponse {
  final int code;
  final String indicator;
  final String message;
  final List<OrderItem>? orders;

  OrdersResponse({
    required this.code,
    required this.indicator,
    required this.message,
    this.orders,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}

@JsonSerializable()
class OrderItem {
  OrderItem({
    required this.code,
    required this.status,
    required this.date,
    required this.client,
    required this.receptor,
    required this.billing,
  });

  final String code;
  final int status;
  final String date;
  final ClientOrder client;
  final ReceptorOrder receptor;
  final BillingOrder billing;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class ClientOrder {
  ClientOrder({required this.code, required this.name});

  final int code;
  final String name;

  factory ClientOrder.fromJson(Map<String, dynamic> json) =>
      _$ClientOrderFromJson(json);
  Map<String, dynamic> toJson() => _$ClientOrderToJson(this);
}

@JsonSerializable()
class ReceptorOrder {
  ReceptorOrder({required this.prefix, required this.phone});

  final String prefix;
  final String phone;

  factory ReceptorOrder.fromJson(Map<String, dynamic> json) =>
      _$ReceptorOrderFromJson(json);
  Map<String, dynamic> toJson() => _$ReceptorOrderToJson(this);
}

@JsonSerializable()
class BillingOrder {
  BillingOrder({required this.nit});

  final String nit;

  factory BillingOrder.fromJson(Map<String, dynamic> json) =>
      _$BillingOrderFromJson(json);
  Map<String, dynamic> toJson() => _$BillingOrderToJson(this);
}
