import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                child: Image.asset(
                   AssetsData.vegetable,
                ),
              ),
            ),
          ),
          Text('الخضار',
          style: Styles.textStyle20.copyWith(
            color: Colors.black
          ),
          )
        ],

      ),
    );
  }
}
