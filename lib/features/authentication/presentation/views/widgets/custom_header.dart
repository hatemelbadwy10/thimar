import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key,
      required this.headerText,
      required this.secText,
      required this.column,
      this.richText});
  final String headerText;
  final String secText;
  final Widget column;
  final RichText? richText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        //  height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.backGround), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Image(
                  image: AssetImage(AssetsData.logo),
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Text(
                headerText,
                style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                secText,
                style: Styles.textStyle16
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              richText ?? RichText(text: TextSpan(text: '')),
              column
            ],
          ),
        ),
      ),
    );
  }
}
