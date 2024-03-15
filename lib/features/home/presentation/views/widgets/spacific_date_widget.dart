import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
class SpecificDateWidget extends StatelessWidget {
  const SpecificDateWidget({super.key, required this.date, required this.icon, this.width});
final String date;
final IconData icon;
final double? width;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.secondary)
      ),
      height: 60.h,
      width: 163.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text (date,
            style: Styles.textStyle15,
            ),
            SizedBox( width:width??  8.w,),
            Icon(
              icon,
              size: 17,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
