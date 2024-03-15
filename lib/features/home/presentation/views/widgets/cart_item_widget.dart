import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
          height: 78.h,
          width: 92.w,
          child: Image.asset(AssetsData.tomato)),
      SizedBox(width: 9.w,),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text('طماطم',
            style: Styles.textStyle15.copyWith(
              fontWeight: FontWeight.bold
            ),

            ),
          ),
          Text('رس 45',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.bold
          ),
          ),
          CounterWidget(
            height:27.h,
            width: 72.w,
            iconHeight: 23.h,
            iconWidth: 23.w,
            iconSize: 12,

          ),

        ],
      ),
      SizedBox(width: 140.w,),
      IconWidget(icon: const Icon(FontAwesomeIcons.trash,
        color: Color(0xffFF0000),
      ), onPress: (){},
        color: const Color(0xffFF0000).withOpacity(.1),

      )
    ],
    );
  }
}
