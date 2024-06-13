import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/core/widgets/num_login.dart';
import 'package:thimar/features/authentication/presentation/manger/register_bloc/register_bloc.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';

import '../../../../home/presentation/manger/get_cities/get_cities_bloc.dart';
import '../../../../home/presentation/manger/get_cities/get_cities_event.dart';
import '../../../../profile/presentation/views/widgets/personal_info_view_body.dart';
import 'cities_sheet.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _form = GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<RegisterBloc>();

  final citiesBloc = KiwiContainer().resolve<CitiesBloc>()..add(GetCitiesDataEvent(),);

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
                      StatefulBuilder(
                        builder: (context, setState) => GestureDetector(
                          onTap: () async {
                            var result = await showModalBottomSheet(
                              context: context,
                              builder: (context) => const CitiesSheets(),
                            );
                            if (result != null) {
                              bloc.selectedCity = result;
                              setState(() {});
                            }
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: AppInput(
                                    labelText:
                                    bloc.selectedCity?.name ?? "المدينة",
                                    validator: (value) {
                                      if (bloc.selectedCity == null) {
                                        return "حقل المدينة مطلوب";
                                      }
                                      return null;
                                    },
                                    prefixIcon:
                                    Icon(Icons.flag),
                                  ),
                                ),
                              ),
                              if (bloc.selectedCity != null)
                                IconButton(
                                  onPressed: () {
                                    bloc.selectedCity = null;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    size: 24.w.h,
                                    color: Colors.red,
                                  ),
                                ),
                            ],
                          ),
                        ),
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
                                    bloc.add(RegisterUserDataEvent());
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
