import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/profile/data/about_model.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
on<GetAboutEvent>(getAbout);
  }
  void getAbout(GetAboutEvent event,Emitter<AboutState>emitter)async{
    emit(AboutLoading());
    final response = await DioHelper().getFromServer(url: 'about');

  if(response.success)
    {
      final model = AboutModel.fromJson(response.response!.data).aboutData;
    emit(AboutSuccess(date: model));
    }
  else{
    emit( AboutFailure());
  }
  }

}
