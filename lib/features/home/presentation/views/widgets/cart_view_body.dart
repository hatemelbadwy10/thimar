import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/views/widgets/cart_item_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/receipt_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBarSec(
                text: 'السلة',
                onPress: () {
                  GoRouter.of(context).pop(AppRouter.kProductDescriptionView);
                }),
            SizedBox(
              height: 400.h,
              width: double.infinity,
              child: Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.h),
                        child: const CartItemWidget(),
                      );
                    }),
              ),
            ),
            const CuponWidget(),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'جميع الأسعار تشمل قيمة الضريبة المضافة %15',
              style: Styles.textStyle14,
            ),
            const ReceiptWidget(),
            const SizedBox(
              height: 11,
            ),
            CustomButton(onPress: () {
              GoRouter.of(context).push(AppRouter.kFinishOrderView);
            }, btnText: 'اتمام الطلب')
          ],
        ),
      ),
    );
  }
}

class CuponWidget extends StatelessWidget {
  const CuponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          hintText: 'عندك كوبون ؟ ادخل رقم الكوبون',
          border: InputBorder.none,
          suffixIcon: CustomButton(
            onPress: () {},
            btnText: 'تطبيق',
            height: 39,
            width: 100,
          ),
        ),
      ),
    );
  }
}
