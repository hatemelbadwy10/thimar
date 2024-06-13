
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/cach_helper.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/widgets/helper_methods.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<SendLogoutEvent>(logout);
  }
  void logout(SendLogoutEvent event ,Emitter<LogoutState>emitter)async{
    emit(LogoutLoading());
final response = await DioHelper().sendToServer(url: 'logout',
body:
{
      'device_token': FirebaseMessaging.instance.getToken(),
      'type': Platform.operatingSystem
    }
    );
if(response.success){
  CacheHelper.removeLoginData();
  emit(
    LogoutSuccess(),
  );
  GoRouter.of(navigatorKey.currentContext!).pushReplacement(AppRouter.kLoginView);

  showSnackBar(
    response.msg,
    typ: MessageType.success,
  );
}
else{
  showSnackBar(
    response.msg,
    typ: MessageType.fail,
  );
  emit(LogoutFailure());
}

  }
}
