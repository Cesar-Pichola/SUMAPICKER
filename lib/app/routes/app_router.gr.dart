// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () => DetailsRouteArgs(
                order: pathParams.getString('order'),
                name: pathParams.getString('name'),
                status: pathParams.getString('status'),
                store: pathParams.getString('store'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsPage(
          order: args.order,
          name: args.name,
          status: args.status,
          store: args.store,
        ),
      );
    },
    OrdersRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => OrdersRouteArgs(
                id: pathParams.getString('id'),
                name: pathParams.getString('name'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrdersPage(
          id: args.id,
          name: args.name,
        ),
      );
    },
    StoresRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoresPage(),
      );
    },
  };
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required String order,
    required String name,
    required String status,
    required String store,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            order: order,
            name: name,
            status: status,
            store: store,
          ),
          rawPathParams: {
            'order': order,
            'name': name,
            'status': status,
            'store': store,
          },
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<DetailsRouteArgs> page =
      PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.order,
    required this.name,
    required this.status,
    required this.store,
  });

  final String order;

  final String name;

  final String status;

  final String store;

  @override
  String toString() {
    return 'DetailsRouteArgs{order: $order, name: $name, status: $status, store: $store}';
  }
}

/// generated route for
/// [OrdersPage]
class OrdersRoute extends PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    required String id,
    required String name,
    List<PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(
            id: id,
            name: name,
          ),
          rawPathParams: {
            'id': id,
            'name': name,
          },
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<OrdersRouteArgs> page = PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({
    required this.id,
    required this.name,
  });

  final String id;

  final String name;

  @override
  String toString() {
    return 'OrdersRouteArgs{id: $id, name: $name}';
  }
}

/// generated route for
/// [StoresPage]
class StoresRoute extends PageRouteInfo<void> {
  const StoresRoute({List<PageRouteInfo>? children})
      : super(
          StoresRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoresRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
