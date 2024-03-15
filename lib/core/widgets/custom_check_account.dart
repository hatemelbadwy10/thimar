import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/constants.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';

class CustomCheckAccount extends StatelessWidget {
  const CustomCheckAccount(
      {super.key, this.checkText, this.onPress, this.btnText});
  final String? checkText;
  final void Function()? onPress;
  final String? btnText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          checkText ?? 'ليس لديك حساب ؟',
          style: Styles.textStyle15.copyWith(color: kPrimaryColor),
        ),
        TextButton(
            onPressed: onPress ??
                () {
                  GoRouter.of(context).push(AppRouter.kLoginView);
                },
            child: Text(
              btnText ?? 'تسجيل الدخول',
              style: Styles.textStyle18,
            ))
      ],
    );
  }
}
