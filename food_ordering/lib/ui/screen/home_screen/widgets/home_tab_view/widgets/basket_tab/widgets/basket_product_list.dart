import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screen/home_screen/widgets/home_tab_view/widgets/basket_tab/basket_tab.dart';

class BasketProductList extends StatefulWidget {
  List<BasketItem> basketItemList = [];
  BasketProductList({Key key, this.basketItemList}) : super(key: key);

  @override
  _BasketProductListState createState() => _BasketProductListState();
}

class _BasketProductListState extends State<BasketProductList> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
      child: Column(
        children: <Widget>[
          ...widget.basketItemList.map((product) => _buildBasketProduct(product))
        ],
      ),
    );
  }
  Widget _buildBasketProduct(BasketItem item) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      item.productType,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Customize",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Icon(
                          FeatherIcons.chevronDown,
                          size: 17.sp,
                          color: Colors.grey[600],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 60.w,
                height: 25.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.qty.toString(),
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                '€' + item.unitPrice.toStringAsFixed(2),
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10.h, 10.w, 0),
            height: 0.5.h,
            width: double.infinity,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

}
