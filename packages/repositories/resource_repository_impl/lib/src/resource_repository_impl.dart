// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages, lines_longer_than_80_chars, omit_local_variable_types

import 'package:core/core.dart';
// import 'package:core/vendors/dio/dio.dart';
import 'package:rest_api/rest_api.dart';

class ResourceRepositoryImpl extends IResourceRespository {
  ResourceRepositoryImpl({required this.restApiClient});

  final RestApiClient restApiClient;
  @override
  Future<Either<String, List<StoreEntity>>> getStores() async {
    // final stores = <StoreEntity>[];
      // final storeModel = <StoreModel>[];

    try {
      final List<StoreEntity> stores = [];

      final response = await restApiClient.getStores();
      if (response.indicator == 'SUCCESSFUL') {
        for (final item in response.stores!) {
          stores.add(StoreEntity.fromModel(item));
        }

        return Right(stores);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either<String, List<OrderEntity>>> getOrders({
    required int store,
    required int type,
  }) async {
    try {
      final List<OrderEntity> orders = [];
      final body = {'store': store, 'type': type};

      final response = await restApiClient.getOrders(body);
      if (response.indicator == 'SUCCESSFUL') {
        for (final item in response.orders!) {
          orders.add(OrderEntity.fromModel(item));
        }

        return Right(orders);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either<String, List<ProductEntity>>> getDetailOrder({
    required int store,
    required String order,
  }) async {
    try {
      final List<ProductEntity> details = [];
      final body = {
        'store': store,
        'order': {'code': order},
      };
      final response = await restApiClient.getDetailOrder(body);
      if (response.indicator == 'SUCCESSFUL') {
        for (final item in response.products!) {
          details.add(ProductEntity.fromModel(item));
        }
        return Right(details);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either<String, ProcessOrdenEntity>> processOrder({
    required int store,
    required String order,
  }) async {
    try {
      final body = {
        'store': store,
        'order': {'code': order},
      };

      final response = await restApiClient.processOrder(body);
      return Right(
        ProcessOrdenEntity(
          code: response.code,
          indicator: response.indicator,
          message: response.message,
        ),
      );
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either<String, DoneEntity>> doneOrder({
    required int store,
    required String order,
  }) async {
    try {
      final body = {
        'store': store,
        'order': {'code': order},
      };

      final response = await restApiClient.doneOrder(body);
      if (response.indicator == 'SUCCESSFUL') {
        return Right(
          DoneEntity(
            code: response.code,
            indicator: response.indicator,
            message: response.message,
          ),
        );
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left('$e');
    }
  }
}
