import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/explore_tab/explore_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/profile_tab/profile_tab.dart';

class HomeTabView extends StatefulWidget {
  HomeTabView({Key key}) : super(key: key);

  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ProfileTab(),
    );
  }
}