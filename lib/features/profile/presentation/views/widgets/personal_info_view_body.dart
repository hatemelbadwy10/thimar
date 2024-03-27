import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/personal_widget.dart';

class PersonalInfoViewBody extends StatelessWidget {
  const PersonalInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomAppBarSec(
                text: 'البيانات الشخصية',
                onPress: () {
                  GoRouter.of(context).pop(AppRouter.kProfileView);
                }),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsData.profile2)),
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 18.sp,
                color: Colors.white,
              ),
            ),
            Text(
              'محمد علي',
              style: Styles.textStyle17,
            ),
            Text(
              '96654787856',
              style: Styles.textStyle17.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            const PersonalWidget(
              title: 'اسم المستخدم',
              text: 'محمد علي',
              iconData: Icons.person_2_outlined,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                countryCode(context),
                const Expanded(
                    child: PersonalWidget(
                        title: 'رقم الجوال',
                        text: "5498874",
                        iconData: FontAwesomeIcons.phoneFlip))
              ],
            ),
            SizedBox(height: 16.h,),
            const PersonalWidget(title: 'المدينة', text: 'محمد علي', iconData:Icons.flag),
            SizedBox(height: 16.h,),

            const PersonalWidget(title: 'كلمة المرور', text: '', iconData:Icons.lock),
            SizedBox(height: 180.h,),
            CustomButton(onPress: (){}, btnText: 'تعديل البيانات'),
            //Todo change Container color and password ui

          ],
        ),
      ),
    );
  }

  Widget countryCode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Container(
        height: 60.h,
        width: 69.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
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
    );
  }
}
