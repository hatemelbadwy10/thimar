import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/themes.dart';

import 'core/utils/cach_helper.dart';
import 'core/utils/kiwi.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  //await initializeDateFormatting('en','');
  CacheHelper.init();
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