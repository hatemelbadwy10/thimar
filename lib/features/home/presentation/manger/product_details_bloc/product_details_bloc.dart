import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/home/data/models/product_details_model.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    on<GetProductDetailsEvent>(getProductDetails);
  }
  void getProductDetails (GetProductDetailsEvent event,Emitter<ProductDetailsState>emitter)async{
    emit(ProductDetailsLoading());
    final response = await DioHelper().getFromServer(url: 'products/${event.id}');
    if (response.success){
      final model = ProductDetailsModel.fromJson(response.response!.data).productDetailsData;
      emit(ProductDetailsSuccess(productDetailsModel: model));
    }
    else{
    emit(ProductDetailsFailure());
    }

    
  }

}
