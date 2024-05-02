import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';

class NumLogin extends StatelessWidget {
  const NumLogin({super.key,  this.controller});
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Container(
            height: 60.h,
            width: 69.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
              child: Column(
                children: [
                  Flag.fromCode(
                    FlagsCode.SA,
                    height: 20.h,
                    width: 32.w,
                    fit: BoxFit.cover,
                    borderRadius: 8.0,
                  ),
                  SizedBox(
                    height: 2.6.h,
                  ),
                  Text(
                    '+966',
                    style: Styles.textStyle15,
                  )
                ],
              ),
            ),
          ),
        ),
         Expanded(
          child: CustomTextField(

            textInputType: TextInputType.number,
            hint: 'رقم الجوال',
            icon: const Icon(FontAwesomeIcons.phoneFlip),
            validatorWord: 'رقم الهاتف',
            controller: controller,
          ),
        )
      ],
    );
  }
}
