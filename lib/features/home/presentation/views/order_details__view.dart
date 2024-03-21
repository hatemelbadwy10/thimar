import 'package:flutter/material.dart';
import 'package:thimar/features/home/presentation/views/widgets/order_details_view_body.dart';
class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderDetailsViewBody(),
    );
  }
}
