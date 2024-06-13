import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/notifactions_view/presentation/views/manger/notifications_bloc.dart';
import 'package:thimar/features/notifactions_view/presentation/views/widgets/custom_notifaction.dart';

import '../../../../../core/utils/assets.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

final bloc = KiwiContainer().resolve<NotificationsBloc>()..add(GetNotificationsEvent());


class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
               if(state is GetNotificationsLoadingState){

                 return _LoadingItem();
               }
               else if(state is GetNotificationsSuccessState){
                 return Expanded(child: ListView.builder(
                     itemCount:state.list.length ,


                     itemBuilder: (context, index) => CustomNotification(notifications: state.list[index],)));
               }
               else{
                 return SizedBox();
               }
              },
            ),

          ],
        ),
      ),
    );
  }
}
class _LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.grey.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          bottom: 16.h,
        ),
        child: Row(
          children: [
            Container(
              height: 33.h,
              width: 33.w,
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 6.5.w, vertical: 6.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: Theme.of(context).primaryColor.withOpacity(0.13),
              ),
              child:Image.asset(
               AssetsData.logo,
                width: 33.w,
                height: 33.h,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الموضوع",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "الموضوع الفرعي",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(
                          0xff989898,
                        )),
                  ),
                  Text(
                    "الوقت",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
