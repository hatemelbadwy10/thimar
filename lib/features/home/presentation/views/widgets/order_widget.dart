import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.status});
final String status;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
GoRouter.of(context).push(AppRouter.kOrderDetailsView);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('طلب #4456',
                 style: Styles.textStyle17,
               ),
               Container(
                 height: 25.h,
                 width: 95.w,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: getOrderStatusBgColor(status,context)

                 ),
                 child: Align(
                   alignment: Alignment.center,
                   child: Text('بانتظار الموافقة',
                   style: Styles.textStyle11.copyWith(
                     color: getOrderStatusTextColor(status,context)

                   ),
                   ),
                 ),
               ),
             ],
           ),
           Text(' يونيو,2021, 27',
           style: Styles.textStyle14.copyWith(
             fontWeight: FontWeight.w200,
             color: Theme.of(context).colorScheme.secondary

           ),
           ),
           const Divider(
             height: 2,
             thickness: .5,
           ),
           Row(
             children: [
               Expanded(
                 child: SizedBox(
                   height: 30.h,
                   width: 300.w,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: 3,
                     itemBuilder: (BuildContext context, int index) {
                       return SizedBox(
                           height: 25.h,
                           width: 25.w,
                           child: Image.asset(AssetsData.test1));
                     },
                   ),
                 ),
               ),
               Container(
                 height: 25.h,
                 width: 25.w,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Theme.of(context).colorScheme.primaryContainer
                 ),
                 child:Text('+2',
                   style: Styles.textStyle15,

                 ),
               ),
               SizedBox(width: 158.w,),
               Text('رس 180',
               style: Styles.textStyle15,
               )




             ],
           )
         ],

      ),
    );
  }
  Color getOrderStatusBgColor(String status, BuildContext context) {
    switch (status) {
      case 'in_progress':
        return Theme.of(context).colorScheme.primaryContainer;
      case 'accepted':
        return const Color(0xffEAFFD5);
      case 'finished':
        return const Color(0xffF3F3F3);
      case 'canceld':
        return Colors.red;

      default:
        return Colors.transparent;
    }
  }
}
Color getOrderStatusTextColor(String status, BuildContext context) {
  switch (status) {
    case 'in_progress':
      return const Color(0xff4C8613);
    case 'accepted':
      return const Color(0xffEAFFD5);
    case 'finished':
      return const Color(0xffA1A1A1);
    case 'canceld':
      return const Color(0xffFF0000);

    default:
      return Colors.transparent;
  }
}
