import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 83.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Text('المنزل',
              style: Styles.textStyle15,
              ),
              Text('شقة 40',

                style: Styles.textStyle12.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w200
                ),

              ),
              Text(' شارع العليا الرياض 12521السعودية',
              style: Styles.textStyle12.copyWith(
                color: Colors.black,
                  fontWeight: FontWeight.w200

              ),)
            ],),
            SizedBox(
              height: 62.h,
                width: 72.w,
                child: Image.asset(AssetsData.address))
          ],
        ),
      ),

    );
  }
}
