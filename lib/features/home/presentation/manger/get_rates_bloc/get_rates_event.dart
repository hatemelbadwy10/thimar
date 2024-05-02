part of 'get_rates_bloc.dart';

@immutable
sealed class GetRatesEvent {}
class GetProductRatingEvent extends GetRatesEvent{
  final int id;

  GetProductRatingEvent({required this.id});
}
