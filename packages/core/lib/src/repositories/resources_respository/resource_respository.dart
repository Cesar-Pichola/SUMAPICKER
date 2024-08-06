// ignore_for_file: public_member_api_docs, one_member_abstracts

import 'package:core/src/entities/stores/store_entity.dart';
import 'package:core/vendors/either/either.dart';

abstract class IResourceRespository {
  Future<Either<String, List<StoreEntity>>> getStores();
}
