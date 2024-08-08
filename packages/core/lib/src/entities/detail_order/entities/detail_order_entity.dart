// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:core/core.dart';

class ProductEntity {
  final int sku;
  final String name;
  final double price;
  final int amount;
  final ImageEnt image;
  ProductEntity(
      {required this.sku,
      required this.name,
      required this.price,
      required this.amount,
      required this.image});

  factory ProductEntity.fromModel(ProductItem model) {
    return ProductEntity(
      sku: model.sku,
      name: model.name,
      price: model.price,
      amount: model.amount,
      image: ImageEnt.fromModel(model.image),
    );
  }
}

class ImageEnt {
  ImageEnt({required this.url});

  final String url;

  factory ImageEnt.fromModel(ImageProduct model) {
    return ImageEnt(url: model.url);
  }
}
