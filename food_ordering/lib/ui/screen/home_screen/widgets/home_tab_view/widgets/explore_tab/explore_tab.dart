import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/explore_tab/widgets/main_app_bar.dart';

class ExploreTab extends StatefulWidget {
  ExploreTab({Key key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {

   Widget _buildCategoryItem({Category category}){
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: 75,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(category.imageUrl),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(height: 5,),
          Text(category.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),)
        ],
      ),
    );
  }

  Widget _buildPopularItem({Product product}){
    return Container(
      padding: EdgeInsets.fromLTRB(6, 6, 13, 6),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[200])
      ),
      child: Row(
        children: [
           Container(
            height: 85,
            width: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(product.imageUrl),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'By '+ product.branch,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                width: 40,
                color: Colors.grey[300],
                margin: const EdgeInsets.only(right: 5.0),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '€' + product.unitPrice.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '€' + product.finalPrice.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNearByDealItem({Product product}){
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(right: 10),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[200])
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 85,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(product.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                margin: EdgeInsets.all(5),
                height: 15,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Text(
                  product.discountPercent.toStringAsFixed(0) + "% OFF",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Text(
            product.branch + "'S",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
            ),
          ),
          Text(
            product.name,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '€' + product.unitPrice.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '€' + product.finalPrice.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 15,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15,),            
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(FeatherIcons.filter, color: Colors.grey[600], size: 16,),
                        SizedBox(width: 5,),
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(width: 15,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...LIST_CATEGORY.map((category) => _buildCategoryItem(category: category))
                  ],
                ),
              ),
              Divider( color: Colors.grey[300],),
               SizedBox(height: 10,),            
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "View all",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...POPULAR_ITEMS.map((product) => _buildPopularItem(product:  product))
                  ],
                ),
              ),
              SizedBox(height: 5,), 
              Divider( color: Colors.grey[300],),
              SizedBox(height: 10,),            
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nearby Deals",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "View all",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
               SizedBox(height: 15,),
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...NEARBY_DEALS.map((product) => _buildNearByDealItem(product:  product))
                  ],
                ),
              ), 
            ],
          ),
        ),
    );
  }
}



class Category {
  String name;
  String imageUrl;
  Category({this.name, this.imageUrl});
}

final List<Category> LIST_CATEGORY = [
  Category(name: "Pizza", imageUrl: "assets/images/sample_image/pizza.jpg"),
  Category(name: "Burgers", imageUrl: "assets/images/sample_image/burger.jpg"),
  Category(name: "Steak", imageUrl: "assets/images/sample_image/steak.jpg"),
  Category(name: "Pasta", imageUrl: "assets/images/sample_image/pasta.jpg"),
  Category(name: "Pizza", imageUrl: "assets/images/sample_image/pizza.jpg"),
];

class Product {
  String name;
  String branch;
  double unitPrice;
  double finalPrice;
  String imageUrl;
  double discountPercent;
  Product({this.name, this.branch, this.finalPrice, this.unitPrice, this.imageUrl, this.discountPercent});
}

final List<Product> POPULAR_ITEMS = [
  Product(name: "Grilled Chicken", branch: "KFC", finalPrice: 14.20, unitPrice: 15.20, imageUrl: 'assets/images/sample_image/grilled_chicken.jpg'),
  Product(name: "Smoky Grilled Chicken", branch: "KFC", finalPrice: 14.20, unitPrice: 15.20, imageUrl: 'assets/images/sample_image/smoky_grilled_chicken.jpg'),
  Product(name: "Grilled Chicken", branch: "KFC", finalPrice: 14.20, unitPrice: 15.20, imageUrl: 'assets/images/sample_image/grilled_chicken.jpg'),
];

final List<Product> NEARBY_DEALS = [
  Product(name: "Mexicam creamy nachos", branch: "McDonald", finalPrice: 14.20, unitPrice: 15.20, imageUrl: 'assets/images/sample_image/grilled_chicken.jpg', discountPercent: 10),
  Product(name: "Mexicam creamy nachos", branch: "McDonald", finalPrice: 14.20, unitPrice: 15.20, imageUrl: 'assets/images/sample_image/smoky_grilled_chicken.jpg', discountPercent: 10),
  Product(name: "Mexicam creamy nachos", branch: "McDonald", finalPrice: 14.20, unitPrice: 15.20, imageUrl: 'assets/images/sample_image/grilled_chicken.jpg', discountPercent: 10),
];