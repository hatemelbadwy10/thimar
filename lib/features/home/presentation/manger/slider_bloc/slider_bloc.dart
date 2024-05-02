import 'package:bloc/bloc.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/home/data/models/slider_model.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_event.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_state.dart';


class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<GetSliderEvent>(getSliderData);

  }
void getSliderData (SliderEvent event, Emitter<SliderState>emitter)async{
emit(SliderLoading());
final response = await DioHelper().getFromServer(url: 'sliders');
if (response.success){
final model =  SliderModel.fromJson(response.response!.data);
emit(SliderSuccess(data: model.data));
}
else{
  emit(SliderFailure());
}
}
}
