import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/core/utils/themes.dart';
class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 33.h,
      width: 33.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,

      ),
      child:  Icon(FontAwesomeIcons.lock,
        color: theme(context).colorScheme.primary,),

    )

    ;
  }
}
