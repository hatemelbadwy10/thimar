import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key, required this.assetImage});
final String assetImage;
  @override
  Widget build(BuildContext context) {
    return  Container(

      height: 33.h,
      width: 33.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: SizedBox(
            height: 19.5,
            width: 19.5,
            child: Image.asset(assetImage)),
      ),
    );
  }
}
