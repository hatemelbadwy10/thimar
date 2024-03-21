
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/bottom_nav_bar/presentation/views/widgets/custom_button_nav_bar.dart';
import 'package:thimar/features/favourite/presentation/views/fav_view.dart';
import 'package:thimar/features/home/presentation/views/home_view.dart';
import 'package:thimar/features/home/presentation/views/my_orders_view.dart';
import 'package:thimar/features/notifactions_view/presentation/views/notifactions_view.dart';
import 'package:thimar/features/profile/presentation/views/profile_view.dart';

import '../../manger/nav_bar_cubit/navbar_cubit.dart';

class BottomNavBarBody extends StatelessWidget {
  const BottomNavBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarCubit, NavbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NavbarCubit.get(context);
          Widget containerBack() {
            if (cubit.currentIndex == 0) {
              return const HomeView();
            } else if (cubit.currentIndex == 1) {
              return const MyOrdersView ();
            } else if (cubit.currentIndex == 2) {
              return const NotificationsView();
            } else if(cubit.currentIndex==3) {
              return const FavView();
            }
            else{
              return const ProfileView();
            }
          }

          return Scaffold(
            bottomNavigationBar: CustomBottomNavBar(
              onChange: (index) {
                cubit.changeBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
            ),
            body: containerBack(),
          );
        });
  }
}
