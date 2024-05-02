part of 'product_details_bloc.dart';

@immutable
sealed class ProductDetailsEvent {}
class GetProductDetailsEvent extends ProductDetailsEvent{
  final int id;
  GetProductDetailsEvent({required this.id});
}
