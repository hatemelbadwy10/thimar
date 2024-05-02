import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/cach_helper.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/core/widgets/helper_methods.dart';
import 'package:thimar/features/authentication/data/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
 on<LoginUserDataEvent>(login);


  }
  final phoneNumberController = TextEditingController();
  final passwordController= TextEditingController();
  void login(LoginUserDataEvent event, Emitter<LoginState> emit)async{
    emit(LoginLoading());
final response = await DioHelper().sendToServer(url: 'login',
body:{
  "phone": phoneNumberController.text,
  "password":passwordController.text,
  "device_token": FirebaseMessaging.instance.getToken(),
  "type": Platform.operatingSystem,
  "user_type": "client"
}
);
print("====================================  =============================");
print(response.response!.data);
print("====================================  =============================");
if(response.success){
  await CacheHelper.saveLoginData(UserModel.fromJson(response.response!.data['data']));
showSnackBar(response.msg);
  GoRouter.of(navigatorKey.currentState!.context)
      .pushReplacement(AppRouter.kNavBar);
  emit(LoginSuccess());

}

else{
  showSnackBar(
    response.msg,
  );
  emit(LoginFailure());

}

  }
}
