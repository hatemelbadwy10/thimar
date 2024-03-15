import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/core/widgets/num_login.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomHeader(
                headerText: 'مرحبا بك مؤة اخري',
                secText: 'يمكنك تسجيل حساب جديد الأن',
                column: Expanded(
                  child: ListView(
                    children: [
                      const CustomTextField(
                        hint: 'اسم المستخدم',
                        icon: Icon(FontAwesomeIcons.user),
                        validatorWord: 'اسم المستخدم',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const NumLogin(),
                      SizedBox(
                        height: 16.h,
                      ),
                      const CustomTextField(
                        hint: 'المدينة',
                        icon: Icon(FontAwesomeIcons.flag),
                        validatorWord: 'المدينة',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const CustomTextField(
                        hint: 'كلمة المرور',
                        icon: Icon(FontAwesomeIcons.unlockKeyhole),
                        validatorWord: 'كلمة المرور',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const CustomTextField(
                        hint: 'تاكيد كلمة المرور',
                        icon: Icon(FontAwesomeIcons.unlockKeyhole),
                        validatorWord: 'كلمة المرور',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomButton(
                          onPress: () {
                            if (_form.currentState?.validate() == true) {
                              GoRouter.of(context)
                                  .push(AppRouter.kConfirmPhoneSignUp);
                            }
                          },
                          btnText: 'تسجيل'),
                      SizedBox(
                        height: 45.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: const CustomCheckAccount()),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
