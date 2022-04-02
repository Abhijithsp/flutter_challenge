import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../modules/homescreen/homescreen.dart';
import '../../utils/constants/colors.dart';

class dashboardscreen extends StatefulWidget {
  const dashboardscreen({Key? key}) : super(key: key);

  @override
  State<dashboardscreen> createState() => _dashboardscreenState();
}

class _dashboardscreenState extends State<dashboardscreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  //Screens for each nav items.
  List<Widget> _NavScreens() {
    return [
      const homescreen(),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: color_gold,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: color_gold,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorites"),
        activeColorPrimary: color_gold,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _NavScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: color_dark,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        decoration: NavBarDecoration(
          border: Border.all(width: 1),
          boxShadow: [
            const BoxShadow(
              color: color_yellow,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
