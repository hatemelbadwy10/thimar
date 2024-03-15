import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPress,
      required this.btnText,
      this.width,
      this.height, this.btnColor, this.btnTextColor});
  final void Function() onPress;
  final String btnText;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Color? btnTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.primary,),
            borderRadius: BorderRadius.circular(12.0),

          ),
        ),
        child: Text(btnText,
            style: Styles.textStyle15.copyWith(color:btnTextColor?? Colors.white)),
      ),
    );
  }
}
