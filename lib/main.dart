import 'package:flutter/material.dart';
import 'package:picker/app/blocs/bloc/selected_stored_bloc.dart';
import 'package:picker/app/features/stores/blocs/store_bloc/stores_bloc.dart';
import 'package:picker/app/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/core.dart';
import 'package:picker/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(); // Llama a configureDependencies antes de runApp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<StoresBloc>(
            lazy: false,
            create: (context) => getIt<StoresBloc>()..add(GetStoresEvent()),
          ),
          BlocProvider<SelectedStoredBloc>(
            create: (context) => getIt<SelectedStoredBloc>(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Suma Picker',
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return child!;
              },
            );
          },
        ));
  }
}
