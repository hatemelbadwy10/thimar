import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thimar/core/utils/styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(    '  إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع هذا النص فقط للملئ الفراغ الفارغ لملئ الفراغ حتي ياتي من الباك اند'

        ,style: Styles.textStyle15.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w200
        )
    );;
  }
}
