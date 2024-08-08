import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDetailUseCase extends UseCase<
    Future<Either<String, List<ProductEntity>>>, RequestDetail> {
  final IResourceRespository resourceRespository;

  GetDetailUseCase({required this.resourceRespository});
  @override
  Future<Either<String, List<ProductEntity>>> call(
      {required RequestDetail params}) {
    return resourceRespository.getDetailOrder(
        store: params.store, order: params.code);
  }
}
