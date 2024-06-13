import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/core/utils/helper.dart';
import 'package:thimar/core/widgets/helper_methods.dart';

import '../../../../home/data/models/cities_model.dart';
import '../../views/confirm_phone_number_login_view.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUserDataEvent>(register);

  
  }
  CityModel? selectedCity;

  final fullNameController= TextEditingController();
  final passwordController= TextEditingController();
  final phoneNumberController= TextEditingController();
  final passwordConfirm= TextEditingController();
  final countryController = TextEditingController();


  void register(RegisterEvent event,Emitter<RegisterState>emit) async{
    emit(RegisterLoading());
    final response = await DioHelper().sendToServer(
        url: 'client_register',
        body:{
        "fullname": fullNameController.text,
        "password":passwordController.text,
        "phone": phoneNumberController.text,
        "password_confirmation": passwordConfirm.text,
          "country_id": 1,
          "city_id": selectedCity!.id,


    }
    );
    if(response.success){
      navigateTo(ConfirmSignupView(phone: phoneNumberController.text, pinCode: '1111',));
      showSnackBar(response.msg);
      emit(RegisterSuccess());

    }
    else{
      showSnackBar(
        response.msg,
      );
      emit(RegisterFailure());

    }
  }
}
