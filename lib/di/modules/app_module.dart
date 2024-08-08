import 'package:core/core.dart';
import 'package:core/vendors/dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:resource_repository_impl/resource_repository_impl.dart';
import 'package:rest_api/rest_api.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
        BaseOptions(baseUrl: 'https://msf-scango-staging-api.gta.com.gt/api/'));
    return dio;
  }

  @lazySingleton
  RestApiClient restApiClient(Dio dio) {
    return RestApiClient(dio);
  }

  @lazySingleton
  IResourceRespository resourceRespository(RestApiClient restApiClient) {
    return ResourceRepositoryImpl(restApiClient: restApiClient);
  }
}
