import 'package:flutter/material.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/confirm_reset_password_body.dart';

class ConfirmResetPassword extends StatelessWidget {
  const ConfirmResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false, body: ConfirmResetPasswordBody());
  }
}
