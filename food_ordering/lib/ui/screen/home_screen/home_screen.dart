import 'dart:ui';

import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/custom_bottom_navigation_bar.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/home_tab_view.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/basket_tab/basket_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/explore_tab/explore_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/history_tab/history_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/profile_tab/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  MenuPositionController _menuPositionController;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);
    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        tabController: _menuPositionController,
        pageController: _pageController,
      ),
      backgroundColor: Color.fromRGBO(248, 246, 246, 1),
      body: HomeTabView(
        pageController: _pageController,
        tabController: _menuPositionController,
      ),
    );
  }
}
