import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/core/widgets/num_login.dart';
import 'package:thimar/features/authentication/presentation/manger/login_bloc/login_bloc.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final bloc = KiwiContainer().resolve<LoginBloc>();
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
                    NumLogin(
                      controller: bloc.phoneNumberController,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      hint: 'كلمة المرور',
                      obscureText: true,
                      icon: const Icon(FontAwesomeIcons.unlockKeyhole),
                      validatorWord: 'كلمة المرور',
                      controller: bloc.passwordController,
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
                    BlocBuilder(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return CustomButton(
                              btnText: 'تسجيل الدخول',
                              onPress: () {
                                if (form.currentState!.validate()) {
                                  bloc.add(
                                    LoginUserDataEvent(),
                                  );


                                }
                              });
                        }
                      },
                    ),
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
                )),
          ],
        ),
      ),
    );
  }
}
