import 'package:flutter/material.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/confirm_phone_number.dart';

class ConfirmSignupViewBody extends StatelessWidget {
  const ConfirmSignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmPhoneNumber(
      headerText: 'تفعيل الحساب',
      onPress: () {},
    );
  }
}
