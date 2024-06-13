import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:thimar/features/authentication/presentation/views/login_view.dart';
import 'package:thimar/features/authentication/presentation/views/new_password_view.dart';

import '../../../../../core/utils/dio_helper.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/helper_methods.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  ConfirmCodeBloc() : super(ConfirmCodeInitial()) {
    on<VerifyCodeEvent>(verify);
    on<ResendCodeEvent>(resend);

  }
  bool isPasswordHidden = true;
  bool isTimerFinished = false;

  final pinCodeController = TextEditingController();
  Future<void> resend(
      ResendCodeEvent event, Emitter<ConfirmCodeState> emit) async {
    final data = await DioHelper().sendToServer(
      url: "resend_code",
      body: {
        "phone": event.phone,
      },
    );
    if(data.success){
      showSnackBar(
        data.msg,
        typ: MessageType.success,
      );
    } else {
      showSnackBar(
        data.msg,
      );
    }
  }
  void verify(VerifyCodeEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(
      ConfirmCodeLoadingState(),
    );
    if (event.isActive) {
      await DioHelper().sendToServer(
        url: "check_code",
        body: {
          "phone": event.phone,
          "code" : event.pinCode,
        },
      );
    }
    final response = await DioHelper().sendToServer(
      url: "verify",
      body: {
        "code": pinCodeController.text,
        "phone": event.phone,
        "device_token": FirebaseMessaging.instance.getToken(),
        "type": Platform.operatingSystem,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      if (event.isActive) {
        navigateTo(
          const LoginView(),
        );
      } else {
        navigateTo(
         NewPasswordView()
        );
      }
      emit(
        ConfirmCodeSuccessState(),
      );
    } else {
      showSnackBar(
        response.msg,
      );
      emit(
        ConfirmCodeFailedState(),
      );
    }
  }
}
