part of 'get_cart_data_bloc.dart';

@immutable
sealed class GetCartDataState {}

final class GetCartDataInitial extends GetCartDataState {}
final class GetCartDataSuccess extends GetCartDataState{
  final List<CartData> list;
  final CartModel cartModel;

  GetCartDataSuccess({required this.list,required this.cartModel});
}
final class GetCartDataFailure extends GetCartDataState{}
final class GetCartDataLoading extends GetCartDataState{}
