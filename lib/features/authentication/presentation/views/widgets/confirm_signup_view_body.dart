import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/features/authentication/presentation/manger/confirm_code_bloc/confirm_code_bloc.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/confirm_phone_number.dart';

class ConfirmSignupViewBody extends StatefulWidget {
  const ConfirmSignupViewBody({super.key, required this.phone, required this.pinCode});
final String phone;
final String pinCode;
  @override
  State<ConfirmSignupViewBody> createState() => _ConfirmSignupViewBodyState();
}

final bloc = KiwiContainer().resolve<ConfirmCodeBloc>();

class _ConfirmSignupViewBodyState extends State<ConfirmSignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return ConfirmPhoneNumber(
          headerText: 'تفعيل الحساب',
          onPress: () {
            bloc.add(VerifyCodeEvent(isActive: false, phone: widget.phone, pinCode: widget.pinCode));

          },
        );
      },
    );
  }
}
