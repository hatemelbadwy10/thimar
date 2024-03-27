import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/charge_widget.dart';
class AllFinancialViewBody extends StatelessWidget {
  const AllFinancialViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAppBarSec(text: 'سجل المعاملات', onPress: (){
          GoRouter.of(context).pop(AppRouter.kWalletView);

        }),
        SizedBox(height: 35.h,),
        Expanded(child: ListView.builder(itemBuilder: (index,context){
          return const ChargeWidget();
        }))
      ],
    );
  }
}
