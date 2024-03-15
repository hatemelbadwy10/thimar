import 'package:flutter/material.dart';
import 'package:thimar/features/home/presentation/views/widgets/finish_order_view_body.dart';
class FinishOrderView extends StatelessWidget {
  const FinishOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: FinishOrderViewBody(),
    );
  }
}
