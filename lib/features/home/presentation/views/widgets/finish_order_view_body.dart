import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/views/diagols/order_created_bottom_sheet.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/receipt_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/spacific_date_widget.dart';

class FinishOrderViewBody extends StatelessWidget {
  const FinishOrderViewBody({super.key});

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
                'الإسم  :  محمد ',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'الجوال : 05068285914 ',
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
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary))),
                  value: const Text('المنزل : 119 طريق الملك عبدالعزيز'),
                  items: const [],
                  onChanged: (value) {}),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpecificDateWidget(
                    date: 'اختر اليوم والتاريخ',
                    icon: Icons.access_time_rounded,
                  ),
                  SpecificDateWidget(
                      date: 'اختر الوقت',
                      icon: Icons.calendar_month,
                      width: 20),
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
              //Todo how to pay widget
              Text(
                'ملخص الطلب',
                style: Styles.textStyle17,
              ),
              SizedBox(
                height: 10.h,
              ),
              const ReceiptWidget(),

              SizedBox(height: 10.h),
              CustomButton(
                onPress: () {
                  orderCreatedSuccessfullyBottomSheet(context);
                },
                btnText: 'إنهاء الطلب',
              )
            ],
          ),
        ),
      ),
    );
  }
}
