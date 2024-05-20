part of 'update_cart_bloc.dart';

@immutable
sealed class UpdateCartState {}

final class UpdateCartInitial extends UpdateCartState {}
final class UpdateCartSuccess extends UpdateCartState{
  final String msg;

  UpdateCartSuccess({required this.msg});
}
final class UpdateCartFailure extends UpdateCartState{
  final String msg;

  UpdateCartFailure({required this.msg}){
    showSnackBar(
      msg,
      typ: MessageType.fail,
    );
  }
}
final class UpdateCartLoading extends UpdateCartState{}
