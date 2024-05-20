part of 'update_cart_bloc.dart';

@immutable
sealed class UpdateCartEvent {}
class SendUpdateEvent extends UpdateCartEvent{
  final int id,amount;

  SendUpdateEvent( {required this.id,required this.amount});
}
