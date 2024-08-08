import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DoneOrderUseCase
    extends UseCase<Future<Either<String, DoneEntity>>, RequestDone> {
  final IResourceRespository resourceRespository;

  DoneOrderUseCase({required this.resourceRespository});

  @override
  Future<Either<String, DoneEntity>> call({required RequestDone params}) {
    return resourceRespository.doneOrder(
        store: params.store, order: params.code);
  }
}
