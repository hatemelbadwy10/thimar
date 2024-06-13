import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/order_details__view.dart';

import '../../../data/models/orders.dart';
class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.orderDetailsModel});

final OrdersModel orderDetailsModel;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();

}



class _OrderWidgetState extends State<OrderWidget> {

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  OrderDetailsView(orderDetailsModel: widget.orderDetailsModel)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('طلب #${widget.orderDetailsModel.id}',
                   style: Styles.textStyle17,
                 ),
                 Container(
                   height: 25.h,
                   width: 95.w,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: getOrderStatusBgColor(widget.orderDetailsModel.status,context)

                   ),
                   child: Align(
                     alignment: Alignment.center,
                     child: Text(
                     getOrderStatus(  widget.orderDetailsModel.status, context),
                     style: Styles.textStyle11.copyWith(
                       color: getOrderStatusTextColor(widget.orderDetailsModel.status,context)

                     ),
                     ),
                   ),
                 ),
               ],
             ),
             Text(
               widget.orderDetailsModel.date,
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
                       itemCount: widget.orderDetailsModel.products.length,
                       itemBuilder: (BuildContext context, int index) {
                         return SizedBox(
                             height: 25.h,
                             width: 25.w,
                             child:
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 1.0),
                           child: Image.network(widget.orderDetailsModel.products[index].url),
                         ));
                       },
                     ),
                   ),
                 ),

                 SizedBox(width: 158.w,),
                 Text(widget.orderDetailsModel.totalPrice.toString(),
                 style: Styles.textStyle15,
                 )




               ],
             )
           ],

        ),
      ),
    );
  }

  Color getOrderStatusBgColor(String status, BuildContext context) {
    switch (status) {
      case 'pending':
        return Theme.of(context).colorScheme.primaryContainer;
      case 'accepted':
        return const Color(0xffEAFFD5);
      case 'finished':
        return const Color(0xffF3F3F3);
      case 'canceled':
        return Colors.red.withOpacity(.2);

      default:
        return Colors.transparent;
    }
  }
}
Color getOrderStatusTextColor(String status, BuildContext context) {
  switch (status) {
    case 'pending':
      return const Color(0xff4C8613);
    case 'accepted':
      return const Color(0xffEAFFD5);
    case 'finished':
      return const Color(0xffA1A1A1);
    case 'canceled':
      return const Color(0xffFF0000);

    default:
      return Colors.transparent;
  }
}
String getOrderStatus(String status , BuildContext context){

  switch (status) {
    case 'pending':
      return 'بإنتظار الموافقة' ;
    case 'accepted':
      return 'قيد التحضير';
    case 'finished':
      return 'منتهي' ;
    case 'canceled':
      return 'طلب ملغي';

    default:
      return 'بإنتظار الموافقة';
  }
  
}
