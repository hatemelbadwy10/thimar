part of 'add_product_to_cart_bloc.dart';

@immutable
sealed class AddProductToCartState {}

final class AddProductToCartInitial extends AddProductToCartState {}
final class AddProductToCartSuccess extends AddProductToCartState{
  final String msg;

  AddProductToCartSuccess({required this.msg}){
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}
final class AddProductToCartLoading extends AddProductToCartState{}
final class AddProductToCartFailure extends AddProductToCartState{
  final String msg;

  AddProductToCartFailure({required this.msg}){
    showSnackBar(
      msg,
      typ: MessageType.fail,
    );
  }
}
