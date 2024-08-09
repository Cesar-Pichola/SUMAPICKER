// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';
part 'detail_model.g.dart';

@JsonSerializable()
class DetailResponse {
  final int code;
  final String indicator;
  final String message;
  final List<ProductItem>? products;

  DetailResponse({
    required this.code,
    required this.indicator,
    required this.message,
    this.products,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DetailResponseToJson(this);
}

@JsonSerializable()
class ProductItem {
  final int sku;
  final String name;
  final double price;
  final int amount;
  final ImageProduct image;

  ProductItem({
    required this.sku,
    required this.name,
    required this.price,
    required this.amount,
    required this.image,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class ImageProduct {
  final String url;
  ImageProduct({required this.url});

  factory ImageProduct.fromJson(Map<String, dynamic> json) =>
      _$ImageProductFromJson(json);
  Map<String, dynamic> toJson() => _$ImageProductToJson(this);
}
