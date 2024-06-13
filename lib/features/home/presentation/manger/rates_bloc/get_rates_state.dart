part of 'get_rates_bloc.dart';

@immutable

class GetProductsRatesStates {}

class GetRatesInitial extends GetProductsRatesStates{}
class AddRateToProductLoadingState extends GetProductsRatesStates {}

class AddRateToProductSuccessState extends GetProductsRatesStates {}

class AddRateToProductFailedState extends GetProductsRatesStates {}
