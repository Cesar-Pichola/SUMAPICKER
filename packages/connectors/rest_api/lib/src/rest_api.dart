// import 'package:core/vendors/injectable/injectable.dart';
// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';
import 'package:core/vendors/dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi()
@lazySingleton
abstract class RestApiClient {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;
}
