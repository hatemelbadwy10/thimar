import 'package:flutter/material.dart';
import 'package:thimar/features/home/data/models/cart_model.dart';
import 'package:thimar/features/home/presentation/views/widgets/finish_order_view_body.dart';
class FinishOrderView extends StatelessWidget {
  const FinishOrderView({super.key, required this.cartModel});
final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: FinishOrderViewBody(cartModel: cartModel,),
    );
  }
}
