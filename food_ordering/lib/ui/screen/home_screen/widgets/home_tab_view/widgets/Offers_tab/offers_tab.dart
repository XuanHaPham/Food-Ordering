import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/Offers_tab/widgets/promos_tab.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/Offers_tab/widgets/restaurants_tab.dart';

class OffersTab extends StatefulWidget {
  OffersTab({Key key}) : super(key: key);

  @override
  _OffersTabState createState() => _OffersTabState();
}

class _OffersTabState extends State<OffersTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 37,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Color.fromRGBO(245, 25, 41, 1),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              clipBehavior: Clip.antiAlias,
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Color.fromRGBO(245, 25, 41, 1),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromRGBO(245, 25, 41, 1),
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'RESTAURANTS',
                  ),
                  Tab(
                    text: 'PROMOS',
                  ),
                ],
              ),
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RestaurantsTab(),
                PromosTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
