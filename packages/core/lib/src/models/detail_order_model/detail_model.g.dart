// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailResponse _$DetailResponseFromJson(Map<String, dynamic> json) =>
    DetailResponse(
      code: (json['code'] as num).toInt(),
      indicator: json['indicator'] as String,
      message: json['message'] as String,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailResponseToJson(DetailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'indicator': instance.indicator,
      'message': instance.message,
      'products': instance.products,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      sku: (json['sku'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      amount: (json['amount'] as num).toInt(),
      image: ImageProduct.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'name': instance.name,
      'price': instance.price,
      'amount': instance.amount,
      'image': instance.image,
    };

ImageProduct _$ImageProductFromJson(Map<String, dynamic> json) => ImageProduct(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageProductToJson(ImageProduct instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
