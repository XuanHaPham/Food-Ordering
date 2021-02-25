import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screens/home_screen/widgets/home_tab_view/widgets/explore_tab/widgets/main_app_bar.dart';

class ExploreTab extends StatefulWidget {
  ExploreTab({Key key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
   Widget _buildCategoryItem({Category category}){
    return Container(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        children: <Widget>[
          Container(
            height: 75.h,
            width: 100.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(category.imageUrl),
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          SizedBox(height: 5.h),
          Text(category.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp,),)
        ],
      ),
    );
  }

  Widget _buildPopularItem({Product product}){
    return Container(
      padding: EdgeInsets.fromLTRB(6.w, 6.h, 13.w, 6.h),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: Colors.grey[200])
      ),
      child: Row(
        children: [
           Container(
            height: 85.h,
            width: 75.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(product.imageUrl),
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'By '+ product.branch,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 1.h,
                width: 40.w,
                color: Colors.grey[300],
                margin: EdgeInsets.only(right: 5.w),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '€' + product.unitPrice.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    '€' + product.finalPrice.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 15.sp,
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
      margin: EdgeInsets.only(right: 10.w),
      width: 200.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: Colors.grey[200])
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 85.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(product.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                margin: EdgeInsets.all(5.w),
                height: 15.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3.r)
                ),
                child: Text(
                  product.discountPercent.toStringAsFixed(0) + "% OFF",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            product.branch + "'S",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp
            ),
          ),
          Text(
            product.name,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13.sp
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '€' + product.unitPrice.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                '€' + product.finalPrice.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 15.sp,
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
          padding: EdgeInsets.only(left: 15.w),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 15.h,),            
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(FeatherIcons.filter, color: Colors.grey[600], size: 16.sp,),
                        SizedBox(width: 5.w,),
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(width: 15.w,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Container(
                height: 100.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...LIST_CATEGORY.map((category) => _buildCategoryItem(category: category))
                  ],
                ),
              ),
              Divider( color: Colors.grey[300],),
               SizedBox(height: 10.h,),            
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "View all",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w,),
                ],
              ),
              SizedBox(height: 15.h,),
              Container(
                height: 100.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...POPULAR_ITEMS.map((product) => _buildPopularItem(product:  product))
                  ],
                ),
              ),
              SizedBox(height: 5.h), 
              Divider( color: Colors.grey[300],),
              SizedBox(height: 10.h,),            
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nearby Deals",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "View all",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w,),
                ],
              ),
               SizedBox(height: 15.h,),
              Container(
                height: 170.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...NEARBY_DEALS.map((product) => _buildNearByDealItem(product:  product))
                  ],
                ),
              ), 
               SizedBox(height: 15.h,),
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