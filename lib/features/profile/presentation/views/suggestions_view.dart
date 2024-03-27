import 'package:flutter/material.dart';
import 'package:thimar/features/profile/presentation/views/widgets/suggestions_view_body.dart';
class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuggestionsViewBody(),
    );
  }
}
