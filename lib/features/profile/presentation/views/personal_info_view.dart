import 'package:flutter/material.dart';
import 'package:thimar/features/profile/presentation/views/widgets/personal_info_view_body.dart';
class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersonalInfoViewBody(),
    );
  }
}
