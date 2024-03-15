import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
class CustomAppBarSec extends StatelessWidget {
  const CustomAppBarSec({super.key, required this.text, required this.onPress});
final String text;
final void Function() onPress;

  @override
  Widget build(BuildContext context) {
      return   Row(
        children: [
          IconWidget(icon: const Icon(FontAwesomeIcons.arrowRight), onPress: onPress
          ),
          SizedBox(width: 80.w,),
          Text(text,
            style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.bold
            ),),

        ],
      );
  }
}
