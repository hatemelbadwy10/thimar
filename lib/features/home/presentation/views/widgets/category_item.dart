import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/data/models/categorys_model.dart';
import 'package:thimar/features/home/presentation/views/category_view.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.data});
  final CategoryData data;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  CategoryView(id: data.id)),
        );


      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 9.w),
        child: Column(
          children: [
            Container(
              height: 73.h,
              width: 73.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
      
              ),
      
              child: Center(
                child: SizedBox(
        height: 37.h,
                  width: 37.h
                  ,
                  child: Image.network(
                     data.media
                  ),
                ),
              ),
            ),
            Text(data.name,
            style: Styles.textStyle20.copyWith(
              color: Colors.black
            ),
            )
          ],
      
        ),
      ),
    );
  }
}
