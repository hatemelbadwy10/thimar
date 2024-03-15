import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/confirm_phone_number.dart';

class ConfirmResetPasswordBody extends StatelessWidget {
  const ConfirmResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmPhoneNumber(
      headerText: 'نسيت كلمة المرور',
      onPress: () {
        GoRouter.of(context).push(AppRouter.kNewPasswordView);
      },
    );
  }
}
