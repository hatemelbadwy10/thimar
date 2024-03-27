import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/charge_widget.dart';
import 'package:thimar/features/profile/presentation/views/widgets/pay_widget.dart';
class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomAppBarSec(text: 'المحفظة', onPress: (){
                GoRouter.of(context).pop(AppRouter.kWalletView);
              }),
            ),
            SizedBox(
                height:100.h),
            Text('رصيدك',style: Styles.textStyle17,),
            SizedBox(height: 18.h,),
            Text('225 رس',
            style: Styles.textStyle17,),
            SizedBox(height: 36.h,),
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
                      child:   Center(child: Text('اشحن الآن',
                      style: Styles.textStyle15,
                      )),

                    ),
                  )
              ),
            ),
            SizedBox(height: 60.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('سجل المعاملات',style: Styles.textStyle17,),
                GestureDetector(
                  onTap: (){},
                  child: Text('عرض الكل',
                        style: Styles.textStyle15.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w200
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            const Column(
              children: [
                ChargeWidget(),
                PayWidget(),


              ],
            )
          ],
        ),
      ),
    );
  }
}
