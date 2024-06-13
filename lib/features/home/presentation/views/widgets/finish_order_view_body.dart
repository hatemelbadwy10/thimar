import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/cach_helper.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/views/diagols/order_created_bottom_sheet.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/receipt_widget.dart';
import '../../../../../core/widgets/helper_methods.dart';
import '../../../data/models/cart_model.dart';
import '../../manger/address_bloc/adress_bloc.dart';
import '../../manger/orders/orders_bloc.dart';
import '../../manger/orders/orders_event.dart';
import '../../manger/orders/orders_state.dart';
import 'get_address_widget.dart';


class FinishOrderViewBody extends StatefulWidget {
  const FinishOrderViewBody({super.key, required this.cartModel});
  final CartModel cartModel;


  @override
  State<FinishOrderViewBody> createState() => _FinishOrderViewBodyState();
}

final addressBloc = KiwiContainer().resolve<AddressBloc>();

final completeBloc = KiwiContainer().resolve<OrdersBloc>();

final _event = PostOrderDataEvent();


class _FinishOrderViewBodyState extends State<FinishOrderViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarSec(
                text: 'إتمام الطلب',
                onPress: () {
                  GoRouter.of(context).pop(AppRouter.kCartView);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'الإسم  :  ${CacheHelper.getFullName()} ',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'الجوال : ${CacheHelper.getPhone()} ',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 33.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اختر عنوان التوصيل',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconWidget(
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPress: () {})
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 26.w,
                height: 26.h,
                child: GetAddressWidget(),
              ),
              SizedBox(
                height: 38.h,
              ),
              Text(
                'تحديد وقت التوصيل',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final day = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(
                                days: 360,
                              ),
                            ),
                          );
                          if (day != null) {
                            _event.date = DateFormat('y-M-d', 'en').format(day);
                         //   print("_____=====____$day");
                            setState(() {});
                          } else {
                            showSnackBar(
                              "يجب اختيار تاريخ",
                              typ: MessageType.warning,
                            );
                          }
                        },
                        child: Container(
                          width: 163.w,
                          height: 60.h,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 13.w,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.r,
                                color: const Color(
                                  0xff000000,
                                ).withOpacity(
                                  0.16,
                                ),
                                blurStyle: BlurStyle.outer,
                                offset: Offset(0.w, 6.h),
                              ),
                            ],
                            borderRadius: BorderRadiusDirectional.circular(
                              15.r,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _event.date ?? "اختر اليوم والتاريخ",
                                style: Styles.textStyle15
                              ),
                             Icon(
                               Icons.calendar_month,
                                size: 17.sp,

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () async {
                          final time1 = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time1 != null) {

                            _event.time = time1
                                .toString()
                                .replaceAll(')', '')
                                .replaceAll('TimeOfDay(', '');

                            setState(() {});
                          } else {
                            showSnackBar(
                              "يجب تحديد وقت",
                              typ: MessageType.warning,
                            );
                          }
                        },
                        child: Container(
                          width: 163.w,
                          height: 60.h,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 13.w,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.r,
                                color: const Color(
                                  0xff000000,
                                ).withOpacity(
                                  0.16,
                                ),
                                blurStyle: BlurStyle.outer,
                                offset: Offset(
                                  0.w,
                                  6.h,
                                ),
                              ),
                            ],
                            borderRadius: BorderRadiusDirectional.circular(
                              15.r,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _event.time ?? "اختر الوقت",
                                style: Styles.textStyle15
                              ),
                             Icon(
                               Icons.timelapse_sharp,
                                size: 17.w,

                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                'ملاحظات وتعليمات',
                style: Styles.textStyle17,
              ),
              TextFormField(
                controller: _event.noteController,
                  minLines: 5, // Set this
                  maxLines: 6, // and this
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _event.payType = "cash";
                      setState(() {});
                    },
                    child: Container(
                      width: 80.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          11.r,
                        ),
                        border: Border.all(
                            color: _event.payType == "cash"
                                ? Theme.of(context).primaryColor
                                : const Color(
                              0xffE9E9E9,
                            )),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Icon(
                            Icons.money,
                            size: 29.r,

                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "كاش",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: _event.payType == "cash"
                                    ? Theme.of(context).primaryColor
                                    : const Color(
                                  0xffE9E9E9,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _event.payType = "visa";
                      setState(() {});
                    },
                    child: Container(
                      width: 80.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          11.r,
                        ),
                        border: Border.all(
                          color: _event.payType == "visa"
                              ? Theme.of(context).primaryColor
                              : const Color(
                            0xffE9E9E9,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                        Icons.credit_card,
                          size: 24.r,

                          color: _event.payType == "visa"
                              ? Theme.of(context).primaryColor
                              : const Color(
                            0xffE9E9E9,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _event.payType = "wallet";
                      setState(() {});
                    },
                    child: Container(
                      width: 120.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          11.r,
                        ),
                        border: Border.all(
                          color: _event.payType == "wallet"
                              ? Theme.of(context).primaryColor
                              : const Color(
                            0xffE9E9E9,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                           AssetsData.finishOrder,
                            width: 29.w,
                            height: 23.h,
                            fit: BoxFit.scaleDown,
                            color: _event.payType == "wallet"
                                ? Theme.of(context).primaryColor
                                : const Color(
                              0xffE9E9E9,
                            ),
                          ),
                          Text(
                            "المحفظة",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: _event.payType == "wallet"
                                    ? Theme.of(context).primaryColor
                                    : const Color(
                                  0xffE9E9E9,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                'ملخص الطلب',
                style: Styles.textStyle17,
              ),
              SizedBox(
                height: 10.h,
              ),
               ReceiptWidget(cartModel:widget.cartModel ),

              SizedBox(height: 10.h),
              BlocConsumer(
                bloc: completeBloc,
  listener: (context, state) {
    if(state is PostOrdersDataSuccessState){
      orderCreatedSuccessfullyBottomSheet;
    }
  },
  builder: (context, state) {
    return CustomButton(
                onPress: () {
                  if (_event.date == null) {
                    DateTime today = DateTime.now();
                    DateTime twoDaysLater = today.add(Duration(days: 2));
                    _event.date = DateFormat('y-M-d', 'en').format(twoDaysLater);
                  } else if (_event.addressModel == null) {
                    showSnackBar(
                      "يجب تحديد العنوان",
                      typ: MessageType.warning,
                    );
                  } else if (_event.time == null) {
                    showSnackBar(
                      "يجب تحديد وقت",
                      typ: MessageType.warning,
                    );
                  }
                  else {
                    completeBloc.add(_event);
                  
                  }
                },
                btnText: 'إنهاء الطلب',
              );
  },
)
            ],
          ),
        ),
      ),
    );
  }
}
