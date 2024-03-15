import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/core/widgets/num_login.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      child: Form(
        key: form,
        child: Column(
          children: [
            CustomHeader(
                headerText: 'مرحبا بك مرة اخري',
                secText: 'يمكنك تسجيل الدخول الان',
                column: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const NumLogin(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const CustomTextField(
                      hint: 'كلمة المرور',
                      obscureText: true,
                      icon: Icon(FontAwesomeIcons.unlockKeyhole),
                      validatorWord: 'كلمة المرور',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.kForgetPasswordView);
                          },
                          child: Text(
                            'هل نسيت كلمة المرور',
                            style: Styles.textStyle16,
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                        btnText: 'تسجيل الدخول',
                        onPress: () {
                          if (form.currentState?.validate() == true) {
                            GoRouter.of(context).pushReplacement(AppRouter.kNavBar);
                          }
                        }),
                    SizedBox(
                      height: 45.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 33.w),
                      child: CustomCheckAccount(
                          checkText: 'ليس لديك حساب؟ ',
                          onPress: () {
                            GoRouter.of(context).push(AppRouter.kSignUpView);
                          },
                          btnText: 'تسجيل الدخول'),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
