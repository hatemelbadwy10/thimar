part of 'get_rates_bloc.dart';

@immutable
sealed class GetRatesEvent {}

class AddRateToProductEvent extends GetRatesEvent {

  final int id, value;
late final TextEditingController? productComment;

  AddRateToProductEvent({required this.id, required this.value}) {
    productComment = TextEditingController();
  }
}