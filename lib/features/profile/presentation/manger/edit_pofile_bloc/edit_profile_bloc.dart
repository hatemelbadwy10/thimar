import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/cach_helper.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../../../core/widgets/helper_methods.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<SendEditProfileEvent>(sendEditProfile);
  }
  final  nameController= TextEditingController();
  final  phoneController= TextEditingController();
  final  passwordController= TextEditingController();
  final  passwordConfirmationController= TextEditingController();

  void sendEditProfile(SendEditProfileEvent event,Emitter<EditProfileState>emitter)async{
emit(EditProfileLoading());
final response = await DioHelper().sendToServer(url: 'client/profile',
body:{
  "image": event.image,
  "fullname": nameController.text,
  "phone": phoneController.text,
  "city_id" :event.cityId

}

);
if(response.success){
  CacheHelper.saveLoginData(response.response!.data['data']);
  emit(EditProfileSuccess());
  showSnackBar(
    response.msg,
    typ: MessageType.success,
  );
}
else{
  emit(EditProfileFailure());
  showSnackBar(
    response.msg,
    typ: MessageType.fail,
  );
}

  }

}
