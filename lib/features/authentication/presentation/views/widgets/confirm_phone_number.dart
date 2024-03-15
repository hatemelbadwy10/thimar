import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/features/authentication/presentation/manger/count_down_cubit.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/counter_widget.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/verification_code.dart';

class ConfirmPhoneNumber extends StatefulWidget {
  const ConfirmPhoneNumber(
      {super.key, required this.headerText, required this.onPress});

  final String headerText;
  final void Function() onPress;
  @override
  State<ConfirmPhoneNumber> createState() => _ConfirmPhoneNumberState();
}

class _ConfirmPhoneNumberState extends State<ConfirmPhoneNumber> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      BlocProvider.of<CountDownCubit>(context).startCount();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountDownCubit, CountDownState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomHeader(
                headerText: widget.headerText,
                secText: '',
                richText: _CustomRichText(context),
                column: Column(
                  children: [
                    const Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerificationCode(
                            first: true,
                            last: false,
                          ),
                          VerificationCode(
                            first: false,
                            last: false,
                          ),
                          VerificationCode(
                            first: false,
                            last: false,
                          ),
                          VerificationCode(
                            first: false,
                            last: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 37.h,
                    ),
                    CustomButton(
                        onPress: widget.onPress, btnText: 'تأكيد الكود'),
                    SizedBox(
                      height: 26.h,
                    ),
                    const Text('لم تستلم الكود؟'
                        'يمكنك إعادة الارسال بعد'),
                    SizedBox(
                      height: 20.h,
                    ),
                    CounterWidget(
                      onComplete: () {
                        BlocProvider.of<CountDownCubit>(context).buttonEnabled =
                            true;
                        setState(() {});
                      },
                      countDownController:
                          BlocProvider.of<CountDownCubit>(context).controller,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                        onPressed: BlocProvider.of<CountDownCubit>(context)
                                .buttonEnabled
                            ? () {
                                BlocProvider.of<CountDownCubit>(context)
                                    .startCount();
                              }
                            : null,
                        style: const ButtonStyle(),
                        child: const Text('إعادة الإرسال')),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: const CustomCheckAccount(),
                    ),
                  ],
                ))
          ],
        ),
      );
    });
  }
}

@override
RichText _CustomRichText(BuildContext context) => RichText(
        text: TextSpan(
            text: 'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال +966',
            style: Styles.textStyle16
                .copyWith(color: Theme.of(context).colorScheme.secondary),
            children: [
          TextSpan(
              text: 'تغيير رقم الجوال',
              style: Styles.textStyle16.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = changePhoneNumber(context))
        ]));
changePhoneNumber(BuildContext context) {
  GoRouter.of(context).push(AppRouter.kLoginView);
}
