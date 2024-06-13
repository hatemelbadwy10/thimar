import 'package:flutter/material.dart';
import 'package:thimar/features/home/data/models/orders_details.dart';
import 'package:thimar/features/home/presentation/views/widgets/order_details_view_body.dart';

import '../../data/models/orders.dart';
class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderDetailsModel});
final OrdersModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OrderDetailsViewBody(orderDetailsModel: orderDetailsModel,),
    );
  }
}
