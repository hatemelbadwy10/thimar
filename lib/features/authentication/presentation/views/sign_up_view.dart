import 'package:flutter/material.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignUpViewBody(),
    );
  }
}
