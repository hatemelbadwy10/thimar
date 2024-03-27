import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
class ChargeWidget extends StatelessWidget {
  const ChargeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Row(
          children: [
            Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  border: Border.all(color: Theme.of(context).colorScheme.primary)
              ),
              child:  Center(
                child: Icon(
                  color: Theme.of(context).colorScheme.primary,
                    Icons.arrow_back
                ),

              ),
            ),
            SizedBox(width: 9.w,),
            Text('شحن المحفظة',
              style: Styles.textStyle15,
            ),
            SizedBox(width: 118.w,),
            Text('27 يونيو 2021',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.secondary
              ),
            ),


          ],
        ),
        SizedBox(height: 9.h,),
        Padding(
          padding:  EdgeInsets.only(right: 48.w),
          child: Align(
            alignment: Alignment.topRight,
            child: Text('255 ر.س',
              style: Styles.textStyle24,
            ),
          ),
        ),

      ],
    );
  }
}
