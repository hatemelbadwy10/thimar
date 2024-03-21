import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/notifactions_view/presentation/views/widgets/custom_notifaction.dart';
class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
        Align(
          alignment: Alignment.center,
          child: Text('الإشعارات',
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold
          ),
          ),
        ),
            SizedBox(height: 44.h,),
            const CustomNotification(
              notificationHeader: 'تم قبول طلبك وجاري تحضيره الأن',
              notificationBody: 'هذا النص هو مثال لنص يمكن أن يستبدل'

                  ' النص من مولد النص العربى',
              notificationTime: 'منذ ساعتان',),const CustomNotification(
              notificationHeader: 'تم قبول طلبك وجاري تحضيره الأن',
              notificationBody: 'هذا النص هو مثال لنص يمكن أن يستبدل'

                  ' النص من مولد النص العربى',
              notificationTime: 'منذ ساعتان',),

            const CustomNotification(
              notificationHeader: 'تم قبول طلبك وجاري تحضيره الأن',
              notificationBody: 'هذا النص هو مثال لنص يمكن أن يستبدل'

                  ' النص من مولد النص العربى',
              notificationTime: 'منذ ساعتان',),
          ],
        ),
      ),
    );
  }
}
