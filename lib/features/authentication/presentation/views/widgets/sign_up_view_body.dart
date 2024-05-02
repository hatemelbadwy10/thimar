import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/core/widgets/num_login.dart';
import 'package:thimar/features/authentication/presentation/manger/register_bloc/register_bloc.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _form = GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<RegisterBloc>();
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
                      CustomTextField(
                        hint: 'اسم المستخدم',
                        icon: const Icon(FontAwesomeIcons.user),
                        validatorWord: 'اسم المستخدم',
                        controller: bloc.fullNameController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      NumLogin(
                        controller: bloc.phoneNumberController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        hint: 'المدينة',
                        icon: const Icon(FontAwesomeIcons.flag),
                        validatorWord: 'المدينة',
                        controller: bloc.countryController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        hint: 'كلمة المرور',
                        icon: const Icon(FontAwesomeIcons.unlockKeyhole),
                        validatorWord: 'كلمة المرور',
                        controller: bloc.passwordController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        hint: 'تاكيد كلمة المرور',
                        icon: const Icon(FontAwesomeIcons.unlockKeyhole),
                        validatorWord: 'كلمة المرور',
                        controller: bloc.passwordConfirm,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          if (State is RegisterLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return CustomButton(
                                onPress: () {
                                  if (_form.currentState?.validate() == true) {
                                    GoRouter.of(context)
                                        .push(AppRouter.kConfirmPhoneSignUp);
                                  }
                                },
                                btnText: 'تسجيل');
                          }
                        },
                      ),
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
