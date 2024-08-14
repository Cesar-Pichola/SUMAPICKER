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
                status: pathParams.getString('status'),
                store: pathParams.getString('store'),
                type: pathParams.getString('type'),
                name: pathParams.getString('name'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsPage(
          order: args.order,
          status: args.status,
          store: args.store,
          type: args.type,
          name: args.name,
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
    required String status,
    required String store,
    required String type,
    required String name,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            order: order,
            status: status,
            store: store,
            type: type,
            name: name,
          ),
          rawPathParams: {
            'order': order,
            'status': status,
            'store': store,
            'type': type,
            'name': name,
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
    required this.status,
    required this.store,
    required this.type,
    required this.name,
  });

  final String order;

  final String status;

  final String store;

  final String type;

  final String name;

  @override
  String toString() {
    return 'DetailsRouteArgs{order: $order, status: $status, store: $store, type: $type, name: $name}';
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
