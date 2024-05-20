part of 'delete_product_bloc.dart';

@immutable
sealed class DeleteProductState {}

final class DeleteProductInitial extends DeleteProductState {}
final class DeleteProductLoading extends DeleteProductState{}
final class DeleteProductSuccess extends DeleteProductState{
  final String msg;

  DeleteProductSuccess({required this.msg}){
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }


}
final class DeleteProductFailure extends DeleteProductState{
  final String msg;
  DeleteProductFailure({required this.msg}){
    showSnackBar(
      msg,
      typ: MessageType.fail,
    );
  }
}
