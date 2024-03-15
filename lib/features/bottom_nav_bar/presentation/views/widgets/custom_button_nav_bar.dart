
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {super.key, required this.onChange, required this.currentIndex});

  final Function(int) onChange;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
type:   BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryColor,

        currentIndex: currentIndex,
onTap: onChange,
        //indicatorColor: KDarkModeBackGroundColor,


        // destinations: <Widget>[
        //   NavigationDestination(
        //       selectedIcon: const Icon(
        //         Icons.home,
        //         color: Colors.white,
        //       ),
        //       icon: Icon(
        //         Icons.home,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //       label: ''),
        //   NavigationDestination(
        //       selectedIcon: Icon(
        //         Icons.calendar_month_outlined,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //       icon: Icon(
        //         Icons.calendar_month_outlined,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //       label: ''),
        //   NavigationDestination(
        //       selectedIcon: const Icon(
        //         FontAwesomeIcons.bell,
        //         color: Colors.white,
        //       ),
        //       icon: Icon(
        //         FontAwesomeIcons.bell,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //       label: ''),
        //   NavigationDestination(
        //       selectedIcon: const Icon(
        //         Icons.favorite,
        //         color: Colors.white,
        //       ),
        //       icon: Icon(
        //         Icons.favorite,
        //         color: Theme.of(context).colorScheme.onBackground,
        //       ),
        //       label: ''),
        // ],
        items: const [
          BottomNavigationBarItem(
              label: 'الرئيسة',
              icon: Icon(Icons.home,
          )


          ), BottomNavigationBarItem(
              label: 'طلباتي',
              icon: Icon(Icons.list,
          )), BottomNavigationBarItem(
              label: 'الإشعارات',
              icon: Icon(FontAwesomeIcons.bell,
          )
          ),
          BottomNavigationBarItem(
              label: 'المفضلة',
              icon: Icon(Icons.favorite,
          )
          ),
          BottomNavigationBarItem(
              label: 'حسابي',
              icon: Icon(Icons.person,
          )
          ),




      ],
      ),
    );
  }
}
