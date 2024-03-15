import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
class ThimarText extends StatelessWidget {
  const ThimarText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(
          height: 20.h,
            width: 20.w,
            child: Image.asset(AssetsData.logo)),
        Text('سله ثمار',
          style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
      ],

    );
  }
}
