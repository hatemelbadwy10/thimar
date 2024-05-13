import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../../../core/widgets/helper_methods.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
  on<SendContactEvent>(sendContact);
  }

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();
  void sendContact(SendContactEvent event,Emitter<ContactState>emitter)async{
emit(ContactLoading());
final response = await DioHelper().sendToServer(url: 'contact',
body: {
  'fullname': nameController.text,
  'phone': phoneNumberController.text,
  'title': 'content',
  'content': subjectController.text,
}

);
if(response.success){
  showSnackBar(
    response.msg,
    typ: MessageType.success,
  );
  phoneNumberController.clear();
  nameController.clear();
  subjectController.clear();
  emit(ContactSuccess());
}
else{
  showSnackBar(
    response.msg,
    typ: MessageType.fail,
  );
  emit(ContactFailure());

}

  }
}
