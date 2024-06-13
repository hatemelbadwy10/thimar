import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/manger/orders/orders_bloc.dart';
import 'package:thimar/features/home/presentation/manger/orders/orders_event.dart';
import 'package:thimar/features/home/presentation/views/widgets/adress_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/order_widget.dart';

import '../../../data/models/orders.dart';
class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key, required this.orderDetailsModel});
final OrdersModel orderDetailsModel;

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}
final bloc =KiwiContainer().resolve<OrdersBloc>();

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarSec(
                text: 'تفاصيل الطلب', onPress: (){
              GoRouter.of(context).pop(AppRouter.kMyOrdersView);
            }),
             OrderWidget(orderDetailsModel: widget.orderDetailsModel),
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
             ReceiptFinishOrderWidget(orderDetailsModel: widget.orderDetailsModel,),
            SizedBox(height: 250.h,),
            button(widget.orderDetailsModel.status),


          ],
        ),
      ),
    );
  }

  Widget button(String status) {
    switch (status) {
      case 'pending':
        return CustomButton(onPress: () {
          bloc.add(CancelOrderDataEvent(orderNum: widget.orderDetailsModel.id));
        }, btnText: 'الغاء الطلب ',
          btnTextColor: Colors.red,
          btnColor: const Color(0xffFFE1E1),
        );

      case 'finished':
        return CustomButton(onPress: () {}, btnText: 'تقييم المنتجات');
      case 'canceled':
        return CustomButton(onPress: () {


        }, btnText: 'تم اللغاء الطلب');

      default:
        return CustomButton(onPress: () {}, btnText: 'الغاء الطلب ',);
    }



  }
}
class ReceiptFinishOrderWidget extends StatelessWidget {
  const ReceiptFinishOrderWidget({super.key, required this.orderDetailsModel, });
  final OrdersModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 125.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primaryContainer
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('إجمالي المنتجات',
                style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.normal

                ),

              ),
              Text(' ${orderDetailsModel.orderPrice}رس',
                style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.normal
                ),
              )
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التوصيل',
                style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.normal

                ),

              ),
              Text('${orderDetailsModel.deliveryPrice}رس',
                style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.normal
                ),
              ),

            ],
          ),
          const Divider(height: 2,
            thickness: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الاجمالي',
                  style: Styles.textStyle15

              ),
              Text('رس${orderDetailsModel.totalPrice}',
                  style: Styles.textStyle15
              ),
                         ],
          ),
          const Divider(height: 2,
            thickness: 1,),
          Center(
            child: Text (
              'تم الدفع بواسطه   ${payMethod(orderDetailsModel.payType,context)}',
              style: Styles.textStyle15,

            ),
          )

        ],),
      ),
    );
  }
  String payMethod(String status,BuildContext context) {
    switch (status) {
      case 'wallet':
        return  'المحفظة';

      case 'visa':
        return 'Visa';

      default:
        return 'المحفظه';
    }


  }

}
