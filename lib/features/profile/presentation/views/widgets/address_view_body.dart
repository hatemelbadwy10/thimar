import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAppBarSec(text: 'العناوين', onPress: (){
          GoRouter.of(context).pop(AppRouter.kProfileView);
        }),
        Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.primary),


          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text('المنزل',
                  style: Styles.textStyle15,
                  ),
                  SizedBox(width: 216.w,),
                  Container(height: 24.h,
                  width: 24.w,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.3),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Icon(
                      color: Colors.red,
                      FontAwesomeIcons.trash
                    ),
                  ),
                  Container(height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:  Icon(
                        color: Theme.of(context).colorScheme.primary,
                        FontAwesomeIcons.trash
                    ),
                  ),

                ],
              ),
              SizedBox(height: 4.h,),
              Text('العنوان : 119 طريق الملك عبدالعزيز',
              style: Styles.textStyle14,
              ),
              SizedBox(height: 4.h,),
              Text('الوصف',
              style: Styles.textStyle14.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w200
              ),
              ),
              SizedBox(height: 4.h,),
              Text('رقم الجوال',
                style: Styles.textStyle14.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w200
                ),
              )

            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kAllFinancialView);
          },
          child: DottedBorder(
              radius: const Radius.circular(12),
              color: Theme.of(context).colorScheme.primary,
              dashPattern: const [12,6],
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:   Center(child: Text('إضافة عنوان',
                    style: Styles.textStyle15,
                  )),

                ),
              )
          ),
        ),

      ],
    );
  }
}
