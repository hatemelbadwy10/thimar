import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/views/widgets/adress_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/order_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/receipt_widget.dart';
class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarSec(text: 'تفاصيل الطلب', onPress: (){
              GoRouter.of(context).pop(AppRouter.kMyOrdersView);
            }),
            const OrderWidget(status: 'in_progress'),
            SizedBox(height: 16.h,),
            Text('عنوان التوصيل',
            style: Styles.textStyle17,
            ),
SizedBox(height: 16.h,),
const AddressWidget(),
            SizedBox(height: 16.h,),
            Text('ملخص الطلب',
            style: Styles.textStyle17,),
            SizedBox(height: 16.h,),
            const ReceiptWidget(),
            SizedBox(height: 290.h,),
            button('in_progress'),


          ],
        ),
      ),
    );
  }
  Widget button(String status) {
    switch (status) {
      case 'in_progress':
        return CustomButton(onPress: () {}, btnText: 'الغاء الطلب ',
          btnTextColor: Colors.red,
          btnColor: const Color(0xffFFE1E1),
        );

      case 'finished':
        return CustomButton(onPress: () {}, btnText: 'تقييم المنتجات');
      case 'canceld':
        return CustomButton(onPress: () {}, btnText: 'الغاء الطلب ');

      default:
        return CustomButton(onPress: () {}, btnText: 'الغاء الطلب ',);
    }


  }
}
