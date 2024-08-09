// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages, lines_longer_than_80_chars, omit_local_variable_types

import 'package:core/core.dart';
// import 'package:core/vendors/dio/dio.dart';
import 'package:rest_api/rest_api.dart';

class ResourceRepositoryImpl extends IResourceRespository {
  ResourceRepositoryImpl({required this.restApiClient});

  final RestApiClient restApiClient;
  @override
  Future<Either<String, List<StoreEntity>>> getStores() async {
    try {
      final stores = <StoreEntity>[];
      final storeModel = <StoreModel>[];
      final data = [
        {
          '__typename': 'Store',
          'id': 525,
          'name': 'SUMA SALAMA',
          'ref': '525_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 502,
          'name': 'SUMA CHIMALTENANGO',
          'ref': '502_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 519,
          'name': 'SUMA PETEN',
          'ref': '519_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 514,
          'name': 'SUMA AMATITLAN',
          'ref': '514_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 528,
          'name': 'SUMA FRAIJANES',
          'ref': '528_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 506,
          'name': 'SUMA MAZATENANGO',
          'ref': '506_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 516,
          'name': 'SUMA CALLE REAL',
          'ref': '516_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 512,
          'name': 'SUMA NARANJO',
          'ref': '512_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 515,
          'name': 'SUMA LOS OLIVOS',
          'ref': '515_SUMA',
        },
        {
          '__typename': 'Store',
          'id': 509,
          'name': 'SUMA TIENDAS ESCUINTLA',
          'ref': '509_SUMA',
        }
      ];

      for (final item in data) {
        storeModel.add(
          StoreModel(code: item['id']! as int, name: item['name']! as String),
        );
      }

      await Future.delayed(
        const Duration(seconds: 2),
        () {
          for (final item in storeModel) {
            stores.add(StoreEntity.fromModel(item));
          }
        },
      );

      return Right(stores);
    } catch (e) {
      return const Left('Error store');
    }
  }

  @override
  Future<Either<String, List<OrderEntity>>> getOrders({
    required int store,
  }) async {
    try {
      final List<OrderEntity> orders = [];
      final body = {'store': store, 'type': 0};

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
      return Right(
        DoneEntity(
          code: response.code,
          indicator: response.indicator,
          message: response.message,
        ),
      );
    } catch (e) {
      return Left('$e');
    }
  }
}
