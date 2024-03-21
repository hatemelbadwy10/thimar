import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';


void orderCreatedSuccessfullyBottomSheet(BuildContext context){

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        height: 450.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 30),
          child: Column(
            children: [
              Image.asset(AssetsData.finishOrder),
              SizedBox(
                height: 23.h,
              ),
              Text(
                'شكرا لك لقد تم تنفيذ طلبك بنجاح',
                style: Styles.textStyle20
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                'يمكنك متابعة حالة الطلب او الرجوع للرئسيية',
                style: Styles.textStyle17.copyWith(
                    color:
                    Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPress: () {
                      GoRouter.of(context).push(AppRouter.kMyOrdersView);
                    },
                    btnText: 'طلباتي',
                    height: 60.h,
                    width: 150.w,
                  ),
                  CustomButton(
                    onPress: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kNavBar);
                    },
                    btnText: 'الرئيسية',
                    height: 60.h,
                    width: 163.w,
                    btnColor: Colors.white,
                    btnTextColor:
                    Theme.of(context).colorScheme.primary,
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}