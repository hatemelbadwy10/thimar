import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
class PersonalWidget extends StatelessWidget {
  const PersonalWidget({super.key, required this.title, required this.text, required this.iconData});
final String title;
final String text;
final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: .2,
              color: Theme.of(context).colorScheme.secondary
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(iconData,
              color: Theme.of(context).colorScheme.primary,
              fill: 1,
            ),
            SizedBox(width: 12.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: Styles.textStyle15.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.normal
                  ),


                ),
                Text(text,
                  style: Styles.textStyle15,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
