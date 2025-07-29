import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_lists.dart';
import 'global_data.dart';

class ShoppingAppHomescreen extends StatefulWidget {
  const ShoppingAppHomescreen({super.key});

  @override
  State<StatefulWidget> createState() => _ShoppingAppHomescreenState();
}

class _ShoppingAppHomescreenState extends State<StatefulWidget> {
  int filterId = 0;
  List<Brands> filters = [
    Brands.all,
    Brands.apple,
    Brands.iQOO,
    Brands.motorola,
    Brands.nothing,
    Brands.oPPO,
    Brands.onePlus,
    Brands.pixel,
    Brands.realme,
    Brands.samsung,
    Brands.vivo,
  ];

  String filterBrandName(Brands brand) {
    String brandName = brand.name;
    brandName =
        brandName.substring(0, 1).toUpperCase() + brandName.substring(1);
    return brandName;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping",
          style: TextStyle(
            color: Color(0xFF04517E),
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return CartPage();
                })
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: Color(0xFF606060),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // search bar
          Card(
            margin: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Color(0xffa5a5a5), fontSize: 20),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color(0xffa5a5a5),
                contentPadding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                border: InputBorder.none,
              ),
              onTapUpOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),

          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < filters.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filterId = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsetsGeometry.symmetric(
                        horizontal: 6,
                        vertical: 20,
                      ),
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: (i == filterId)
                            ? Color(0xFFCAE8F4)
                            : Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Text(
                        filterBrandName(filters[i]),
                        style: TextStyle(
                          color: Color(0xFF5C5C5C),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Products
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (int i = 0; i < 2 && filterId == 0; i++)
                    ProductLists(brand: filters[i + 1]),
                  if (filterId != 0) ProductLists(brand: filters[filterId]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
