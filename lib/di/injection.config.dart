// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/core.dart' as _i494;
import 'package:core/vendors/dio/dio.dart' as _i48;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:picker/app/blocs/bloc/selected_stored_bloc.dart' as _i957;
import 'package:picker/app/blocs/selected_order_bloc/selected_order_bloc.dart'
    as _i1073;
import 'package:picker/app/features/details/bloc/bloc_detail/detail_bloc.dart'
    as _i787;
import 'package:picker/app/features/details/bloc/done_bloc/done_bloc.dart'
    as _i569;
import 'package:picker/app/features/details/bloc/Process_bloc/process_bloc.dart'
    as _i816;
import 'package:picker/app/features/details/use_case/done_order.dart' as _i82;
import 'package:picker/app/features/details/use_case/get_detail.dart' as _i270;
import 'package:picker/app/features/details/use_case/process_order.dart'
    as _i98;
import 'package:picker/app/features/orders/blocs/orders_bloc/orders_bloc.dart'
    as _i693;
import 'package:picker/app/features/orders/use_cases/get_orders.dart' as _i513;
import 'package:picker/app/features/stores/blocs/store_bloc/stores_bloc.dart'
    as _i325;
import 'package:picker/app/features/stores/use_cases/get_stores.dart' as _i205;
import 'package:picker/di/modules/app_module.dart' as _i1025;
import 'package:rest_api/rest_api.dart' as _i992;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i1073.SelectedOrderBloc>(
        () => _i1073.SelectedOrderBloc());
    gh.lazySingleton<_i957.SelectedStoredBloc>(
        () => _i957.SelectedStoredBloc());
    gh.lazySingleton<_i48.Dio>(() => appModule.dio());
    gh.lazySingleton<_i992.RestApiClient>(
        () => appModule.restApiClient(gh<_i48.Dio>()));
    gh.lazySingleton<_i494.IResourceRespository>(
        () => appModule.resourceRespository(gh<_i992.RestApiClient>()));
    gh.lazySingleton<_i205.GetStoresUseCase>(() => _i205.GetStoresUseCase(
        resourceRespository: gh<_i494.IResourceRespository>()));
    gh.lazySingleton<_i513.GetOrdersUseCase>(() => _i513.GetOrdersUseCase(
        resourceRespository: gh<_i494.IResourceRespository>()));
    gh.lazySingleton<_i98.ProcessOrderUseCase>(() => _i98.ProcessOrderUseCase(
        resourceRespository: gh<_i494.IResourceRespository>()));
    gh.lazySingleton<_i270.GetDetailUseCase>(() => _i270.GetDetailUseCase(
        resourceRespository: gh<_i494.IResourceRespository>()));
    gh.lazySingleton<_i82.DoneOrderUseCase>(() => _i82.DoneOrderUseCase(
        resourceRespository: gh<_i494.IResourceRespository>()));
    gh.lazySingleton<_i325.StoresBloc>(
        () => _i325.StoresBloc(gh<_i205.GetStoresUseCase>()));
    gh.lazySingleton<_i787.DetailBloc>(
        () => _i787.DetailBloc(gh<_i270.GetDetailUseCase>()));
    gh.lazySingleton<_i569.DoneBloc>(
        () => _i569.DoneBloc(gh<_i82.DoneOrderUseCase>()));
    gh.lazySingleton<_i816.ProcessBloc>(
        () => _i816.ProcessBloc(gh<_i98.ProcessOrderUseCase>()));
    gh.lazySingleton<_i693.OrdersBloc>(
        () => _i693.OrdersBloc(gh<_i513.GetOrdersUseCase>()));
    return this;
  }
}

class _$AppModule extends _i1025.AppModule {}
