import 'package:flutter/material.dart';
import 'package:thimar/features/home/presentation/views/widgets/my_orders_view_body.dart';
class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyOrdersViewBody(),
    );
  }
}
