import 'package:flutter/material.dart';

import '../../categories/categories_screen.dart';
import '../../summary/summary_screen.dart';
import '../../profile/profile_screen.dart';
import '../home_screen.dart';

class HomeButtonNavBar extends StatelessWidget {
  final int currentIndex;

  const HomeButtonNavBar({
    super.key,
    required this.currentIndex,
  });

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget screen;

    switch (index) {
      case 0:
        screen = const HomeScreen();
        break;

      case 1:
        screen = const CategoriesScreen();
        break;

      case 2:
        screen = const SummaryScreen();
        break;

      case 3:
        screen = const ProfileScreen();
        break;

      default:
        screen = const HomeScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff2E7D32),
      unselectedItemColor: Colors.grey,

      onTap: (index) => _navigate(context, index),

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: "Summary",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "Profile",
        ),
      ],
    );
  }
}