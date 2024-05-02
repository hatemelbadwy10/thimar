part of 'get_rates_bloc.dart';

@immutable
sealed class GetRatesState {}

final class GetRatesInitial extends GetRatesState {}
final class GetRatesLoading extends GetRatesState{}
final class GetRatesSuccess extends GetRatesState{
  final List<RatingData> list;

  GetRatesSuccess({required this.list});
}
final class GetRatesFailure extends GetRatesState{}
