import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOrdersUseCase
    extends UseCase<Future<Either<String, List<OrderEntity>>>, int> {
  final IResourceRespository resourceRespository;

  GetOrdersUseCase({required this.resourceRespository});
  @override
  Future<Either<String, List<OrderEntity>>> call({required int params}) {
    return resourceRespository.getOrders(store: params);
  }
}
