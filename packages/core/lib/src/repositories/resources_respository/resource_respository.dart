// ignore_for_file: public_member_api_docs, one_member_abstracts, unnecessary_import, lines_longer_than_80_chars

import 'package:core/core.dart';
import 'package:core/src/entities/detail_order/entities/detail_order_entity.dart';
import 'package:core/src/entities/stores/store_entity.dart';
import 'package:core/vendors/either/either.dart';

abstract class IResourceRespository {
  Future<Either<String, List<StoreEntity>>> getStores();
  Future<Either<String, List<OrderEntity>>> getOrders({required int store});
  Future<Either<String, List<ProductEntity>>> getDetailOrder({
    required int store,
    required String order,
  });
  Future<Either<String, ProcessOrdenEntity>> processOrder({
    required int store,
    required String order,
  });

  Future<Either<String, DoneEntity>> doneOrder({
    required int store,
    required String order,
  });
}
