import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../data/models/notifactions_model.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsStates> {
  NotificationsBloc() : super(NotificationsStates()) {
   on<GetNotificationsEvent>(getNotifications);
  }
  void getNotifications(GetNotificationsEvent event,Emitter<NotificationsStates>emitter)async{
    emit(GetNotificationsLoadingState());
    final response=await DioHelper().getFromServer(url: 'notifications');
  if(response.success){
    print('===============================');
    print(response.response!.data);
    print('===============================');

    final model = NotificationsModel.fromJson(response.response!.data).notificationsData.notifications;
    emit(GetNotificationsSuccessState(list: model));
  }
  else{
    emit(GetNotificationsFailedState());
  }
  }
}
