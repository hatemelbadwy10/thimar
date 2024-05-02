import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/home/data/models/categorys_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
   on<GetCategoryEvent>(getCategory);
    
  }
  void getCategory(CategoryEvent event,Emitter<CategoryState>emitter)async{
    emit(CategoryLoading());
    final response = await DioHelper().getFromServer(url: 'categories');
    print('=====================================');
    print(response.response!.data);
    print('=====================================');
    if(response.success){
      final model = CategoryModel.fromJson(response.response!.data);
      emit(CategorySuccess(categoryData: model.categoryData));
    }
    else{
      emit(CategoryFailure());
    }
  }
}
