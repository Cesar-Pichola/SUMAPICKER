import 'package:auto_route/auto_route.dart';
import 'package:picker/app/features/details/main.dart';
import 'package:picker/app/features/orders/main.dart';
import 'package:picker/app/features/stores/main.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: StoresRoute.page,
            path: '/',
            initial: true,
            keepHistory: false),
        AutoRoute(
          page: OrdersRoute.page,
          path: '/orders/:name/:id',
        ),
        AutoRoute(
          page: DetailsRoute.page,
          path: '/detail',
        )
      ];
}
