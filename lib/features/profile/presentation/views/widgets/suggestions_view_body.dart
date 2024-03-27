import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/contact_widget.dart';
class SuggestionsViewBody extends StatelessWidget {
  const SuggestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBarSec(text: 'الأقتراحات والشكاوي', onPress: (){
            GoRouter.of(context).pop(AppRouter.kProfileView);
          }),
          SizedBox(height: 50.h,),
          const ContactWidget()
        ],
      ),
    );
  }
}
