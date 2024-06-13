
import '../../../data/models/cities_model.dart';

class GetCitiesStates {}

class GetCitiesLoadingState extends GetCitiesStates {}

class GetCitiesFailedState extends GetCitiesStates {}

class GetCitiesSuccessState extends GetCitiesStates {
  final List<CityModel> list;

  GetCitiesSuccessState({required this.list});

}
