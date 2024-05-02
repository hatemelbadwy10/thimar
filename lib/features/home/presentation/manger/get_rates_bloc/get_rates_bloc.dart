import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../data/models/product_rate_model.dart';

part 'get_rates_event.dart';
part 'get_rates_state.dart';

class GetRatesBloc extends Bloc<GetRatesEvent, GetRatesState> {
  GetRatesBloc() : super(GetRatesInitial()) {
   on<GetProductRatingEvent>(getProductRate);
  }
  void getProductRate(GetProductRatingEvent event,Emitter<GetRatesState>emitter)async{
    emit(GetRatesFailure());
    final response = await DioHelper().getFromServer(url: 'products/${event.id}/rates');
if(response.success){
final model = ProductRateModel.fromJson(response.response!.data).ratingData;
emit(GetRatesSuccess(list: model));
}
else{
  emit(GetRatesFailure());
}
  }
}
