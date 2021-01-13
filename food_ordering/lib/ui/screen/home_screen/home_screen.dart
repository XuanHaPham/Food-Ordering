import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/custom_bottom_navigation_bar.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/home_tab_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(highlightItemKey: BottomBarItemKey.OldOrder,),
      backgroundColor: Color.fromRGBO(248, 246, 246, 1),
      body: HomeTabView(),
    );
  }
}