import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_item.dart';
class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return
     SizedBox(
        height: 125.h,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
            return const CategoryItem();

        }),
      )
    ;
  }
}
