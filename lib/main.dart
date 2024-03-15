import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/themes.dart';

void main() {
  runApp(const Thimar());
}
class Thimar extends StatelessWidget {
  const Thimar({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: theme(context),
        builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
      
      ),
    );
  }
}
