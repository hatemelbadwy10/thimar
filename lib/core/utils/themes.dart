// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:thimar/constants.dart';
import 'package:thimar/core/utils/themes.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
  dividerColor: Colors.transparent,
      colorScheme: Theme.of(context).colorScheme.copyWith(

          surfaceVariant: Colors.transparent,
          primary: kPrimaryColor,
          secondary: Colors.grey,
          primaryContainer: const Color(0xffEBF5E1)),
      navigationBarTheme:
          const NavigationBarThemeData(backgroundColor: kPrimaryColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kPrimaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: kPrimaryColor,
            fontFamily: 'Tajawal',
          ),
    expansionTileTheme: const ExpansionTileThemeData(

      collapsedIconColor: kPrimaryColor,
      collapsedTextColor: kPrimaryColor,
      iconColor: kPrimaryColor,
      textColor: kPrimaryColor,

    )

  );
}
