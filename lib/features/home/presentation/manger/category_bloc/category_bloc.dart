import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/home/data/models/categorys_model.dart';

import '../../../data/models/search_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {

    on<GetCategoryEvent>(getCategory);
    
  }
  final searchController = TextEditingController();

  void getCategory(CategoryEvent event,Emitter<CategoryState>emitter)async{
    emit(CategoryLoading());
    final response = await DioHelper().getFromServer(url: 'categories');
    if(response.success){
      final model = CategoryModel.fromJson(response.response!.data);
      emit(CategorySuccess(categoryData: model.categoryData));
    }
    else{
      emit(CategoryFailure());
    }
  }
  void getSearchData(
      GetSearchDataEvent event, Emitter<CategoryState> emit) async {
    final response = await DioHelper().getFromServer(url: "search", params: {
      "keyword": searchController.text,
    });
    if (response.success) {
      final data =
          SearchData.fromJson(response.response!.data).data.searchResult;
      emit(
        GetSearchDataSuccessState(
          data: data,
        ),
      );
    } else {
      emit(
        GetSearchDataFailedState(),
      );
    }
  }
}
