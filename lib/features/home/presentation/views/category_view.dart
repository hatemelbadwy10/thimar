import 'package:flutter/material.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_view_body.dart';
class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CategoryViewBody(id: id,),
    );
  }
}
