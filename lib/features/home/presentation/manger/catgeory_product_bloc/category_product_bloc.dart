import 'package:bloc/bloc.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/home/data/models/category_products_model.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_event.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_state.dart';


class CategoryProductBloc extends Bloc<CategoryProductEvent, CategoryProductState> {


  CategoryProductBloc() : super(CategoryProductInitial()) {
  on<GetCategoryProductEvent>(getCategoryProduct);
  }
  void getCategoryProduct(GetCategoryProductEvent event,Emitter<CategoryProductState>emitter,)async{

    emit(CategoryProductLoading());
    final response = await DioHelper().getFromServer(url: 'categories/${event.id}');
    if(response.success){
      final model = CategoryProductsModel.fromJson(response.response!.data);
      emit(CategoryProductSuccess(list: model.data));
    }
    else{
      emit(CategoryProductFailure());
    }
  }
}
