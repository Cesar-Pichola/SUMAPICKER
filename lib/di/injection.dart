import 'package:core/vendors/injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'init')
configureDependencies() => getIt.init();
