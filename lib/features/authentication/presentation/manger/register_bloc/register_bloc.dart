import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/core/widgets/helper_methods.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUserDataEvent>(register);

  
  }
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
        "lat": '250.0515',
        "lng":'290.45',

    }
    );
    if(response.success){
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
