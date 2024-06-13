import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/features/notifactions_view/data/models/notifactions_model.dart';
class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key, required this.notifications, });
final Notifications notifications;
@override
  Widget build(BuildContext context) {
    return  Container(

      height: 33.h,
      width: 33.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: SizedBox(
            height: 19.5,
            width: 19.5,
            child: Image.network(notifications.image)),
      ),
    );
  }
}
