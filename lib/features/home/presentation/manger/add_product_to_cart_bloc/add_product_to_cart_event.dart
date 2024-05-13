part of 'add_product_to_cart_bloc.dart';

@immutable
sealed class AddProductToCartEvent {}
class SendProductToCartEvent extends AddProductToCartEvent{
  final int productId,amount;

  SendProductToCartEvent({required this.productId, required this.amount});
}
