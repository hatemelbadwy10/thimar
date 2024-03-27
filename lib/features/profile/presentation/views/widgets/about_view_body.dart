import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/custom_text.dart';
class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          CustomAppBarSec(text: 'عن التطبيق', onPress: (){
            GoRouter.of(context).pop(AppRouter.kProfileView);
          }),
          SizedBox(height: 24.h,),
          Center(child: Image.asset(AssetsData.logo)),
          SizedBox(height: 24.h,),
      const CustomText(),
        ],
      ),
    );
  }
}
