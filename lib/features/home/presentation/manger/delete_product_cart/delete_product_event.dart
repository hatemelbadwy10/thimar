part of 'delete_product_bloc.dart';

@immutable
sealed class DeleteProductEvent {}
class SendDeletedProductEvent extends DeleteProductEvent{
  final int id;

  SendDeletedProductEvent({required this.id});
}
