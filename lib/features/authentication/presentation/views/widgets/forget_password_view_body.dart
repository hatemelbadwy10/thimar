import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/num_login.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: form,
        child: Column(
          children: [
            CustomHeader(
                headerText: 'نسيت كلمة المرور',
                secText: 'أدخل رقم الجوال المرتبط بحسابك',
                column: Column(
                  children: [
                    const NumLogin(),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButton(
                        onPress: () {
                          if (form.currentState?.validate() == true) {
                            GoRouter.of(context)
                                .push(AppRouter.kConfirmResetPassword);
                          }
                        },
                        btnText: 'تأكيد رقم الجوال'),
                    SizedBox(
                      height: 45.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 33.w),
                      child: const Center(child: CustomCheckAccount()),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
