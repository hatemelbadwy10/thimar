import 'package:flutter/material.dart';
import 'package:thimar/features/bottom_nav_bar/presentation/views/widgets/bottom_nav_bar_body.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavBarBody(),
    );
  }
}
