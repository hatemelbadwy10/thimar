import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_widget.dart';
class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          CustomAppBarSec(text: 'خضروات', onPress: (){
            GoRouter.of(context).pop(AppRouter.kHomeView);
          }),
          const CustomTextField(hint: 'ابحث عن ماتريد؟', icon: Icon(Icons.search), validatorWord: ''),
          SizedBox(height: 30.h,),
          Expanded(
            child: GridView.builder(
                physics: const ScrollPhysics(),

                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing:3,
                    childAspectRatio: 190/350,
                    crossAxisCount: 2
                ),
                itemBuilder: (context,index){
                  return const ProductWidget();

                }),
          )

        ],

      ),
    );
  }
}
