import 'package:flutter/material.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_description_view_body.dart';
class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductDescriptionViewBody() ,
    );
  }
}
