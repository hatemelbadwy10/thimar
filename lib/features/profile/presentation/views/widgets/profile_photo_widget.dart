import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/cach_helper.dart';
import 'package:thimar/core/utils/styles.dart';
  class ProfilePhotoWidget extends StatelessWidget {
    const ProfilePhotoWidget({super.key});

    @override
    Widget build(BuildContext context) {
      return  Container(
        height: 217.h,
        width: double.infinity,
        decoration:  const BoxDecoration(
            color: Color(0xff4C8613),
            borderRadius:
            BorderRadius.only(
                bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: Column(
              children: [
                Text('حسابي',
                  style: Styles.textStyle20.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold

                  ),
                ),
                SizedBox(height: 21.h,),
                SizedBox(
                    height: 71.h,
                    width: 76.w,
                    child: Image.network(CacheHelper.getImage())),
                Text(CacheHelper.getFullName(),
                  style: Styles.textStyle14.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                Text(CacheHelper.getPhone(),
                  style: Styles.textStyle14.copyWith(
                    color: Theme.of(context).colorScheme.secondary,

                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
  }
