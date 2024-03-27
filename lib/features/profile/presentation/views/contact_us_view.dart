import 'package:flutter/material.dart';
import 'package:thimar/features/profile/presentation/views/widgets/contact_us_view_body.dart';
class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,

      body: ContactUsViewBody(),
    );
  }
}
