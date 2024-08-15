import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:picker/app/blocs/bloc/selected_stored_bloc.dart';
import 'package:picker/app/features/stores/blocs/store_bloc/stores_bloc.dart';
import 'package:picker/app/features/stores/widgets/store_item.dart';
import 'package:picker/app/routes/app_router.dart';
import 'package:picker/app/widgets/custom_buttoms/custom_outline_buttom.dart';
import 'package:picker/di/injection.dart';
import 'package:picker/gen/colors.gen.dart';

class StoresList extends StatefulWidget {
  const StoresList({
    super.key,
  });

  @override
  State<StoresList> createState() => _StoresListState();
}

class _StoresListState extends State<StoresList> {
  int _selectedOption = 0;
  String _nameStore = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.dm, horizontal: 30.dm),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 5,
            offset: const Offset(0, 0.1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.dm.clamp(6, 10),
                ),
                child: BlocBuilder<StoresBloc, StoresState>(
                  builder: (context, state) {
                    if (state.status is UILoading) {
                      return const SpinKitThreeBounce(
                        color: Colors.red,
                        size: 40.0,
                      );
                    }
                    if (state.status is UIError) {
                      return const Text('Error');
                    }
                    if (state.status is UISuccess) {
                      return ListView.separated(
                        itemCount: state.stores!.length,
                        separatorBuilder: (context, index) =>
                            Container(height: 10),
                        itemBuilder: (context, index) {
                          final item = state.stores![index];
                          return RadioListTile<int>(
                            title: ItemStore(
                              name: item.name,
                            ),
                            activeColor: AppColor.primary,
                            value: item.code,
                            groupValue: _selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                final store = state.stores!.firstWhere(
                                  (element) => element.code == value,
                                );
                                _nameStore = store.name;
                                _selectedOption = value!;
                              });
                            },
                          );
                        },
                      );
                    }
                    return Container();
                  },
                )),
          ),
          BlocListener<SelectedStoredBloc, SelectedStoredState>(
            listener: (context, state) {
              if (state.id != null && state.name != null) {
                context.navigateTo(
                    OrdersRoute(id: state.id.toString(), name: state.name!));
              }
            },
            child: CustomOutlineButtom(
                onPressed: () {
                  getIt<SelectedStoredBloc>().add(
                      SelectedStoreEnv(id: _selectedOption, name: _nameStore));
                },
                textBtn: 'Confirmar',
                width: 200,
                height: 35),
          )
        ],
      ),
    );
  }
}
