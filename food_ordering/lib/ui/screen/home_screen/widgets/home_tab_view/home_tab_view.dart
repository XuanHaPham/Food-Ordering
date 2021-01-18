import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/basket_tab/basket_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/explore_tab/explore_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/history_tab/history_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/profile_tab/profile_tab.dart';

class HomeTabView extends StatefulWidget {
  final MenuPositionController tabController;
  final PageController pageController;
  HomeTabView({Key key, this.pageController, this.tabController}) : super(key: key);

  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  
  bool userPageDragging = false;
   void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      widget.tabController.findNearestTarget(widget.pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          checkUserDragging(scrollNotification);
        },
        child: PageView(
          controller: widget.pageController,
          children: <Widget>[
            ExploreTab(),
            HistoryTab(),
            BasketTab(),
            ProfileTab(),
          ],
        ),
      );
  }
}