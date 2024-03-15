import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 111.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primaryContainer
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('إجمالي المنتجات',
              style: Styles.textStyle15.copyWith(
                fontWeight: FontWeight.normal

              ),

              ),
              Text('رس 180',
              style: Styles.textStyle15.copyWith(
                fontWeight: FontWeight.normal
              ),
              )
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الخصم',
                style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.normal

                ),

              ),
              Text('رس 40-',
                style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.normal
                ),
              ),

            ],
          ),
          const Divider(height: 2,
          thickness: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الاجمالي',
                style: Styles.textStyle15

              ),
              Text('رس 140',
                style: Styles.textStyle15
              ),

            ],
          ),
        ],),
      ),
    );
  }
}
