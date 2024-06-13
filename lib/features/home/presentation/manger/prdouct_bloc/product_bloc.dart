import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(getProduct);
  }
  void getProduct (GetProductEvent event,Emitter<ProductState>emitter)async{
    emit(ProductLoading());
    final response =  await DioHelper().getFromServer(url: 'products');
    if(response.success){
      final model = GetProductsModel.fromJson(response.response!.data);
      emit(ProductSuccess(list: model.data));


    }
    else{

      emit(ProductFailure());
    }
  }
}