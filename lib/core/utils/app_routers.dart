import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/widgets/helper_methods.dart';
import 'package:thimar/features/authentication/presentation/manger/count_down_cubit/count_down_cubit.dart';
import 'package:thimar/features/authentication/presentation/views/confirm_phone_number_login_view.dart';
import 'package:thimar/features/authentication/presentation/views/confirm_phone_number_reset_password_view.dart';
import 'package:thimar/features/authentication/presentation/views/forget_password_view.dart';
import 'package:thimar/features/authentication/presentation/views/login_view.dart';
import 'package:thimar/features/authentication/presentation/views/new_password_view.dart';
import 'package:thimar/features/authentication/presentation/views/sign_up_view.dart';
import 'package:thimar/features/bottom_nav_bar/presentation/manger/nav_bar_cubit/navbar_cubit.dart';
import 'package:thimar/features/bottom_nav_bar/presentation/views/bottom_nav_bar.dart';
import 'package:thimar/features/home/presentation/manger/counter_cubit/counter_cubit.dart';
import 'package:thimar/features/home/presentation/views/cart_view.dart';
import 'package:thimar/features/home/presentation/views/category_view.dart';
import 'package:thimar/features/home/presentation/views/finish_order_view.dart';
import 'package:thimar/features/home/presentation/views/home_view.dart';
import 'package:thimar/features/home/presentation/views/my_orders_view.dart';
import 'package:thimar/features/home/presentation/views/order_details__view.dart';
import 'package:thimar/features/home/presentation/views/product_description_view.dart';
import 'package:thimar/features/profile/presentation/views/about_view.dart';
import 'package:thimar/features/profile/presentation/views/address_view.dart';
import 'package:thimar/features/profile/presentation/views/all_financial_view.dart';
import 'package:thimar/features/profile/presentation/views/contact_us_view.dart';
import 'package:thimar/features/profile/presentation/views/personal_info_view.dart';
import 'package:thimar/features/profile/presentation/views/privacy_view.dart';
import 'package:thimar/features/profile/presentation/views/profile_view.dart';
import 'package:thimar/features/profile/presentation/views/questions_view.dart';
import 'package:thimar/features/profile/presentation/views/suggestions_view.dart';
import 'package:thimar/features/profile/presentation/views/wallet_view.dart';
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
  static const kMyOrdersView='/myOrdersView';
  static const kOrderDetailsView ='/orderDetailsView';
  static const kCategoryView='/categoryView';
  static const kProfileView ='/profileView';
  static const kAboutView='/aboutView';
  static const kPrivacyView='/privacyView';
  static const kQuestionsView = '/questionsView';
  static const kContactUsView ='/contactUsView';
  static const kSuggestionsView='/suggestionsView';
  static const kPersonalInfoView ='/personalInfoView';
  static const kWalletView ='/walletView';
  static const kAllFinancialView ='/allFinancialView';
  static const kAddressView ='/addressView';




  static final router = GoRouter(

      navigatorKey: navigatorKey,
      routes: [
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
          create: (context) => NavbarCubit(), child: const BottomNavBar()),
    ),
    GoRoute(
        path: '/productDescriptionView',

        builder: (context, state) => BlocProvider(
            create: (context) => CounterCubit(),
            child:  ProductDescriptionView(id:1, isFavourite: false,))),

    GoRoute(
      path: '/cartView',
      builder: (context, state) => BlocProvider(
          create: (context) => CounterCubit(), child: const CartView()),
    ),
    GoRoute(
      path: '/finishOrderView',
      builder: (context, state) => const FinishOrderView(),
    ),
    GoRoute(
      path: '/myOrdersView',
      builder: (context, state) => const MyOrdersView(),
    ),
    GoRoute(
      path: '/orderDetailsView',
      builder: (context, state) => const OrderDetailsView(),
    ),
    GoRoute(
      path: '/categoryView',
      builder: (context, state) => const CategoryView(id: 1,),

    ),
    GoRoute(
      path: '/profileView',
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: '/aboutView',
      builder: (context, state) => const AboutView(),
    ),
    GoRoute(
      path: '/privacyView',
      builder: (context, state) => const PrivacyView(),
    ),
    GoRoute(
      path: '/questionsView',
      builder: (context, state) => const QuestionsView(),
    ),
    GoRoute(
      path: '/contactUsView',
      builder: (context, state) => const ContactUsView(),
    ),
    GoRoute(
      path: '/suggestionsView',
      builder: (context, state) => const SuggestionsView(),
    ),
    GoRoute(
      path: '/personalInfoView',
      builder: (context, state) => const PersonalInfoView(),
    ),
    GoRoute(
      path: '/walletView',
      builder: (context, state) => const WalletView(),
    ),
    GoRoute(
      path: '/allFinancialView',
      builder: (context, state) => const AllFinancialView(),
    ),
    GoRoute(
      path: '/addressView',
      builder: (context, state) => const AddressView(),
    ),
  ]);
}
