import 'package:flutter/material.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/confirm_signup_view_body.dart';

class ConfirmSignupView extends StatelessWidget {
  const ConfirmSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ConfirmSignupViewBody(),
    );
  }
}
