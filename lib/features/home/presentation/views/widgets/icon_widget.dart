import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon, required this.onPress, this.color, this.height,  this.width});
final Icon icon;
final Color? color;
final double? height;
final double? width;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height?? 32.h,
      width: width?? 32.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color?? Theme.of(context).colorScheme.primaryContainer
      ),
      child: Center(
        child: IconButton(onPressed: onPress, icon: icon ,

        ),
      ),
    );
  }
}
