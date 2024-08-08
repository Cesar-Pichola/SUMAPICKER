part of 'detail_bloc.dart';

class DetailState {
  final List<ProductEntity>? products;
  final String? message;
  final UIStatus? status;

  DetailState({this.products, this.message, this.status = const UIInitial()});
}
