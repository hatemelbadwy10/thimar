import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/confirm_signup_view_body.dart';
import '../../../home/presentation/manger/counter_cubit/counter_cubit.dart';

class ConfirmSignupView extends StatelessWidget {
  const ConfirmSignupView(
      {super.key, required this.phone, required this.pinCode});

  final String phone;
  final String pinCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ConfirmSignupViewBody(phone: phone, pinCode: pinCode,),
      ),
    );
  }
}
