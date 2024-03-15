import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/features/authentication/presentation/manger/count_down_cubit.dart';
import 'package:thimar/features/authentication/presentation/views/confirm_phone_number_login_view.dart';
import 'package:thimar/features/authentication/presentation/views/confirm_phone_number_reset_password_view.dart';
import 'package:thimar/features/authentication/presentation/views/forget_password_view.dart';
import 'package:thimar/features/authentication/presentation/views/login_view.dart';
import 'package:thimar/features/authentication/presentation/views/new_password_view.dart';
import 'package:thimar/features/authentication/presentation/views/sign_up_view.dart';
import 'package:thimar/features/bottom_nav_bar/presentation/manger/nav_bar_cubit/navbar_cubit.dart';
import 'package:thimar/features/bottom_nav_bar/presentation/views/widgets/bottom_nav_bar_body.dart';
import 'package:thimar/features/home/manger/counter_cubit/counter_cubit.dart';
import 'package:thimar/features/home/presentation/views/cart_view.dart';
import 'package:thimar/features/home/presentation/views/finish_order_view.dart';
import 'package:thimar/features/home/presentation/views/home_view.dart';
import 'package:thimar/features/home/presentation/views/product_description_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kNewPasswordView = '/newPasswordView';
  static const kConfirmPhoneSignUp = '/newConfirmPhoneSignUp';
  static const kConfirmResetPassword = '/newConfirmResetPassword';
  static const kNavBar = '/kNavBar';
  static const kProductDescriptionView = '/productDescriptionView';
  static const kCartView = '/cartView';
  static const kFinishOrderView='/finishOrderView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kNewPasswordView,
      builder: (context, state) => const NewPasswordView(),
    ),
    GoRoute(
      path: kConfirmPhoneSignUp,
      builder: (context, state) => BlocProvider(
          create: (BuildContext context) {
            return CountDownCubit()..startCount();
          },
          child: const ConfirmSignupView()),
    ),
    GoRoute(
      path: kConfirmResetPassword,
      builder: (context, state) => BlocProvider(
          create: (BuildContext context) {
            return CountDownCubit()..startCount();
          },
          child: const ConfirmResetPassword()),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/kNavBar',
      builder: (context, state) => BlocProvider(
          create: (context) => NavbarCubit(), child: const BottomNavBarBody()),
    ),
    GoRoute(
        path: '/productDescriptionView',
        builder: (context, state) => BlocProvider(
            create: (context) => CounterCubit(),
            child: const ProductDescriptionView())),
    GoRoute(
      path: '/cartView',
      builder: (context, state) => BlocProvider(
          create: (context) => CounterCubit(), child: const CartView()),
    ),
    GoRoute(
      path: '/finishOrderView',
      builder: (context, state) => const FinishOrderView(),
    ),

  ]);
}
