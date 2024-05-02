part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState{}
final class ProductSuccess extends ProductState{
  List<GetProductsData> list;
  ProductSuccess({required this.list});

}
final class ProductFailure extends ProductState{}

