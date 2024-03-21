import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
class ProfileListViewItem extends StatelessWidget {
  const ProfileListViewItem({super.key, required this.title, required this.icon, required this.onPress});
final String title;
final IconData icon;
final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPress,
        child: SizedBox(
          height: 48.h,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleWidget(context),
                  Icon(
                   Icons.arrow_circle_left_outlined ,
                    color: Theme.of(context).colorScheme.secondary,
                  )

                ],
              ),
              SizedBox(height: 10.h,),
              const Divider(thickness: .2,)
            ],
          ),

        ),
      ),
    );
  }
  Widget titleWidget(BuildContext context){
    return Row(
      children: [
        Icon(icon,
          fill: .8,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(width:9.w),
        Text(title,
          style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),


      ],
    );

  }
}

