import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../data/models/cart_model.dart';

part 'get_cart_data_event.dart';
part 'get_cart_data_state.dart';

class GetCartDataBloc extends Bloc<GetCartDataEvent, GetCartDataState> {
  GetCartDataBloc() : super(GetCartDataInitial()) {
   on<GetDataEvent>(getData);
  }
  void getData(GetDataEvent event,Emitter<GetCartDataState>emitter)async{
    emit(GetCartDataLoading());
    final response = await DioHelper().getFromServer(url: 'client/cart');
    final model = CartModel.fromJson(response.response!.data).cartData;
    dynamic cartModel=CartModel.fromJson( response.response!.data);
    if(response.success){
      emit(GetCartDataSuccess(list: model, cartModel: cartModel));
    }
    else{
      emit(GetCartDataFailure());
    }
  }
}
