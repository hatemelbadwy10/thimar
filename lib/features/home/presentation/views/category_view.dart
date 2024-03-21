import 'package:flutter/material.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_view_body.dart';
class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoryViewBody(),
    );
  }
}
