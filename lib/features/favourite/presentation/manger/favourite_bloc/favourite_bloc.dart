import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/core/widgets/helper_methods.dart';
import 'package:thimar/features/favourite/data/favourite_model.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
on<GetFavouriteListEvent>(getFavouriteList);
on<AddToFavouriteEvent>(addToFavourite);
on<RemoveFromFavouriteEvent>(removeFromFavourite);
  }
  void getFavouriteList( GetFavouriteListEvent event,Emitter<FavouriteState>emitter)async{
    emit(FavouriteLoading());
    final response = await DioHelper().getFromServer(url: 'client/products/favorites');
  if(response.success){
    final list = FavouritesData.fromJson(response.response!.data).list;
    emit(FavouriteSuccess(list: list ));

  }
  else{
    emit(FavouriteFailure());
  }
  }
  void addToFavourite( AddToFavouriteEvent event ,Emitter<FavouriteState>emitter)async{
final response =await DioHelper().sendToServer(url: 'client/products/${event.id}/add_to_favorite');

showSnackBar(response.msg);
emit(AddToFavouritesSuccessState());
  }
  void removeFromFavourite(RemoveFromFavouriteEvent event,Emitter<FavouriteState>emitter) async{
    final response = await DioHelper().sendToServer(url: 'client/products/${event.id}/remove_from_favorite');
    showSnackBar(response.msg);
    emit(RemoveFromFavouritesSuccessState());
  }
  
}
