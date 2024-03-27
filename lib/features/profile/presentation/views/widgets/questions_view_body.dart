import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/custom_text.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBarSec(
              text: 'اسئلة متكررة',
              onPress: () {
                GoRouter.of(context).push(AppRouter.kProfileView);
              }),
          SizedBox(height: 25.h,),
          Expanded(
            child: ListView.builder(itemBuilder: (index,context){
              return ExpansionTile(
                title: Text(
                  'كيفية الدفع عن طريق البطاقة الإئتمانيه؟',
                  style: Styles.textStyle15,
                ),
                children: const [CustomText()],
              );
            }),
          )
        ],
      ),
    );
  }
}
