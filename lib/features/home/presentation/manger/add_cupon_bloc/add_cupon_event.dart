part of 'add_cupon_bloc.dart';

@immutable
sealed class AddCouponEvent {}
class SendCouponEvent extends AddCouponEvent{}
