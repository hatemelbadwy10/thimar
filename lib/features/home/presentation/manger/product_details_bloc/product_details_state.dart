part of 'product_details_bloc.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState{}
final class ProductDetailsSuccess extends ProductDetailsState{
  final ProductDetailsData productDetailsModel;

  ProductDetailsSuccess({required this.productDetailsModel});
}
final class ProductDetailsFailure extends ProductDetailsState{}

