import 'package:flutter/material.dart';
import 'package:thimar/features/profile/presentation/views/widgets/questions_view_body.dart';
class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuestionsViewBody(),
    );
  }
}
