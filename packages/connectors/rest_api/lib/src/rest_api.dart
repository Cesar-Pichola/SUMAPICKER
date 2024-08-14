// import 'package:core/vendors/injectable/injectable.dart';
// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';
import 'package:core/vendors/dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi()
@lazySingleton
abstract class RestApiClient {
  @factoryMethod
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;
  
  @POST('stores/')
  Future<StoresResponse> getStores();

  @POST('orders/')
  Future<OrdersResponse> getOrders(@Body() Map<String, dynamic> body);

  @POST('orders/detail')
  Future<DetailResponse> getDetailOrder(@Body() Map<String, dynamic> body);

  @POST('orders/actions/process')
  Future<ProcessResponse> processOrder(@Body() Map<String, dynamic> body);

  @POST('orders/actions/done')
  Future<DoneResponse> doneOrder(@Body() Map<String, dynamic> body);
}
