import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProcessOrderUseCase extends UseCase<
    Future<Either<String, ProcessOrdenEntity>>, RequestProcess> {
  final IResourceRespository resourceRespository;

  ProcessOrderUseCase({required this.resourceRespository});

  @override
  Future<Either<String, ProcessOrdenEntity>> call(
      {required RequestProcess params}) {
    return resourceRespository.processOrder(
        store: params.store, order: params.code);
  }
}
