import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/views/widgets/contact_widget.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                CustomAppBarSec(
                    text: 'تواصل معنا',
                    onPress: () {
                      GoRouter.of(context).pop(AppRouter.kProfileView);
                    }),
                SizedBox(
                    height: 168,
                    width: double.infinity,
                    child: Image.asset(AssetsData.addressSec)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [

                  Container(

                    height: 119.h,
                    width: 290.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          customInfo(context, 'شارع الملك فهد , جدة ,',
                              Icons.location_on_outlined),
                          SizedBox(
                            height: 17.h,
                          ),
                          customInfo(context, '+966 054 87452', Icons.phone),
                          SizedBox(
                            height: 17.h,
                          ),
                          customInfo(context, 'info@thimar.com ', Icons.mail),
                        ],
                      ),
                    ),
                  ),
                  const ContactWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customInfo(BuildContext context, String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          text,
          style: Styles.textStyle14.copyWith(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
