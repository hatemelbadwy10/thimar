import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/assets.dart';

import '../../../../../core/utils/app_routers.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHomeView();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).replace(AppRouter.kLoginView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsData.backGround),
              fit: BoxFit.fill
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
        ],
      ),
    );
  }
}
