import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/core/widgets/custom_check_account.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/features/authentication/presentation/views/widgets/custom_header.dart';
class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final form =GlobalKey<FormState>() ;

    return  Padding(
      padding:  EdgeInsets.all(16.w),
      child: Form(
        key: form,
        child: Column(
          children: [
            CustomHeader(headerText: 'نسيت كلمة المرور', secText: 'أدخل كلمة المرور الجديدة', column:
            Column(
              children: [
                const CustomTextField(hint: 'كلمة المرور', icon: Icon(FontAwesomeIcons.unlockKeyhole), validatorWord: 'كلمةالمرور',),
                SizedBox(height: 16.h,),
                const CustomTextField(hint: 'تأكيد كلمة المرور', icon: Icon(FontAwesomeIcons.unlockKeyhole), validatorWord: 'كلمة المرور',),
                SizedBox(height: 25.h,),
                CustomButton(onPress: (){
                  if(form.currentState?.validate() ==true) {
                   // GoRouter.of(context).push(AppRouter.kConfirmResetPassword);
                  }
                }, btnText: 'تغيير كلمة المرور'),
                Padding(
                  padding:  EdgeInsets.all(33.w),
                  child: const CustomCheckAccount(),
                )

              ],
            )

            )
          ],
        ),
      ),
    );
  }
}
