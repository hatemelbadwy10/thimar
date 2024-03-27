import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';

class PayWidget extends StatelessWidget {
  const PayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0x00ff0000).withOpacity(.3),
                  border: Border.all(color: Colors.red)),
              child: const Center(
                child: Icon(color: Colors.red, Icons.arrow_forward),
              ),
            ),
            SizedBox(
              width: 9.w,
            ),
            Text(
              'دفعت مقابل هذا الطلب',
              style: Styles.textStyle15,
            ),
            SizedBox(
              width: 61.w,
            ),
            Text(
              '27 يونيو 2021',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        SizedBox(
          height: 22.h,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kOrderDetailsView);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'طلب #4456',
                    style: Styles.textStyle17,
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 30.h,
                      width: 300.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                              height: 25.h,
                              width: 25.w,
                              child: Image.asset(AssetsData.test1));
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.primaryContainer),
                    child: Text(
                      '+2',
                      style: Styles.textStyle15,
                    ),
                  ),
                  SizedBox(
                    width: 158.w,
                  ),
                  Text(
                    'رس 180',
                    style: Styles.textStyle15,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
