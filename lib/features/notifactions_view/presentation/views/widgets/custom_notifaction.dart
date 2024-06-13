import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/notifactions_view/data/models/notifactions_model.dart';
import 'package:thimar/features/notifactions_view/presentation/views/widgets/custom_notification_icon.dart';
class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key, required this.notifications, });
final Notifications notifications;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

        ),

         child:    Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(

                  children: [
                     CustomNotificationIcon( notifications: notifications,),
                    SizedBox(width: 18.w,),
                    Text(
                      notifications.title,
                    style: Styles.textStyle12.copyWith(
                      color: Colors.black
                    ),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 53.w),
                child: Text(notifications.body,
                style: Styles.textStyle10.copyWith(
                  color: Theme.of(context).colorScheme.secondary
                ),

                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 53.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(notifications.createdAt,
                  style: Styles.textStyle10.copyWith(
                    color: Colors.black
                  ),
                  ),
                ),
              )
            ],
            )

      ),
    );
  }
}
