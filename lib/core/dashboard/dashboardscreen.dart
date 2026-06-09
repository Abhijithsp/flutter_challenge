import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../modules/homescreen/homescreen.dart';
import '../../utils/constants/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // Screens for each nav item.
  List<Widget> _navScreens() {
    return [
      const HomeScreen(),
      Container(
        color: color_dark,
        child: const Center(
          child: Text(
            'Search Events',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      Container(
        color: color_dark,
        child: const Center(
          child: Text(
            'Favorite Events',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        title: "Home",
        activeColorPrimary: color_gold,
        inactiveColorPrimary: Colors.white38,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_rounded),
        title: "Search",
        activeColorPrimary: color_gold,
        inactiveColorPrimary: Colors.white38,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_rounded),
        title: "Favorites",
        activeColorPrimary: color_gold,
        inactiveColorPrimary: Colors.white38,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _navScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.white.withOpacity(0.02),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          colorBehindNavBar: color_dark,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
        ),
        navBarStyle: NavBarStyle.style9, // Use a premium floating style or style 9
      ),
    );
  }
}
