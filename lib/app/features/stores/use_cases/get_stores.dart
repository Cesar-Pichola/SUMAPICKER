import 'package:core/core.dart';

@lazySingleton
class GetStoresUseCase
    extends UseCase<Future<Either<String, List<StoreEntity>>>, void> {
  final IResourceRespository resourceRespository;

  GetStoresUseCase({required this.resourceRespository});
  @override
  Future<Either<String, List<StoreEntity>>> call({void params}) {
    return resourceRespository.getStores();
  }
}
