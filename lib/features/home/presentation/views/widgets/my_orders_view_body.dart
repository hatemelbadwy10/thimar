import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/tab_bar_widget.dart';
class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('طلباتي',
                      style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold
                      ),
                      ),
            ),
            SizedBox(height: 25.h),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: TabBarWidget(),
              ),
            )

            

          ],
        ),
      ),
    );
  }
}
