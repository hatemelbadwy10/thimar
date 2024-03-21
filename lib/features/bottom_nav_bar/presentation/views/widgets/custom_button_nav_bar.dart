
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
    return BottomNavigationBar(

    type:   BottomNavigationBarType.fixed,
      backgroundColor: kPrimaryColor,
      currentIndex: currentIndex,
    elevation: 0,
    onTap: onChange,
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
    );
  }
}
