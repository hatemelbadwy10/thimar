import 'package:flutter/material.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ForgetPasswordViewBody(),
    );
  }
}
