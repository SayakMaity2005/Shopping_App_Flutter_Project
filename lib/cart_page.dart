import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/global_data.dart';
import 'package:shopping_app/product_details_page.dart';

class CartPage extends StatefulWidget {
  // final Mobile brandModel;
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double xOffset = 0;
  final double maxXOffset = 200;
  bool animate = false;
  bool dragLimitExceed = false;
  bool itemRemoved = false;
  late double cardWidth;
  int selectedItemIdx = -1;
  // Details summary format
  String summaryDetails(MobileDetailsCart brandModel) {
    String ram = "${brandModel.ram} GB";
    String storage = (brandModel.storage >= 1024)
        ? "${brandModel.storage ~/ 1024} TB"
        : "${brandModel.storage} GB";
    String color = brandModel.color;
    return "$ram, $storage, Color: $color";
  }

  // Price Format Method
  String priceFormatter(MobileDetailsCart brandModel) {
    String priceKey = "${brandModel.ram}-${brandModel.storage}";
    String priceFormat;
    if (brandModel.brandModelsData.priceVariant.containsKey(priceKey)) {
      int price = brandModel.brandModelsData.priceVariant[priceKey]!;
      priceFormat = price.toString();
    } else {
      return "--";
    }
    for (int i = 0; i < priceFormat.length; i++) {
      int idx = priceFormat.length - i - 1;
      if (i == 5 && priceFormat.length <= 6) continue;
      if (i == 2 || i == 5) {
        priceFormat =
            "${priceFormat.substring(0, idx)},${priceFormat.substring(idx)}";
      }
    }
    return "₹ $priceFormat";
  }

  // Added Item details Card
  Widget cartItemDetailsCard(MobileDetailsCart brandModel) {
    return Card(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          spacing: 20,
          children: [
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    brandModel.brandModelsData.colors[brandModel.color]!,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                // Container(
                //   margin: EdgeInsetsGeometry.symmetric(horizontal: 20),
                Text(
                  brandModel.brandModelsData.model[ModelVariant.modelName]!,
                  style: TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // ),
                Text(
                  summaryDetails(brandModel),
                  style: TextStyle(color: Color(0xFF515151), fontSize: 14),
                ),
                Text(
                  priceFormatter(brandModel),
                  style: TextStyle(
                    color: Color(0xFF00405A),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom proper showDialog to cancel properly by outside tap
  Future showProperDialog({
    required BuildContext context,
    required int index,
  }) async {
    bool buttonClicked = false;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Remove this item ?", textAlign: TextAlign.center),
          titlePadding: EdgeInsetsGeometry.fromLTRB(20, 30, 20, 0),
          titleTextStyle: TextStyle(
            color: Color(0xFF3E3E3E),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          content: Text(
            "This item will be deleted permanently and this process is not reversible.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                buttonClicked = true;
                dragLimitExceed = false;
                Navigator.of(context).pop();
                Future.delayed(Duration(milliseconds: 10), () {
                  setState(() {
                    animate = true;
                    xOffset = 0.0;
                    selectedItemIdx = -1;
                  });
                });
                Future.delayed(Duration(milliseconds: 100), () {
                  animate = false;
                });
              },
              child: Text("Cancel", style: TextStyle(fontSize: 18)),
            ),
            TextButton(
              onPressed: () {
                buttonClicked = true;
                dragLimitExceed = true;
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((duration) {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).removeItem(index);
                  setState(() {
                    itemRemoved = true;
                    animate = false;
                  });
                });
                Future.delayed(Duration(milliseconds: 200), () {
                  setState(() {
                    animate = true;
                    dragLimitExceed = false;
                    itemRemoved = false;
                    xOffset = 0.0;
                    selectedItemIdx = -1;
                  });
                });
                Future.delayed(Duration(milliseconds: 500), () {
                  animate = false;
                });
              },
              child: Text(
                "Remove",
                style: TextStyle(color: Color(0xFFB6254B), fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
    if (!buttonClicked) {
      dragLimitExceed = false;
      Future.delayed(Duration(milliseconds: 10), () {
        setState(() {
          animate = true;
          xOffset = 0.0;
          selectedItemIdx = -1;
        });
      });
      Future.delayed(Duration(milliseconds: 100), () {
        animate = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cardWidth = MediaQuery.of(context).size.width;
    final List<MobileDetailsCart> brandModelList = Provider.of<CartProvider>(
      context,
    ).cartItemList;
    // final List<Mobile> brandModelList = [widget.brandModel];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: (brandModelList.isEmpty)
          ? Center(
              child: Text(
                "No items yet",
                style: TextStyle(color: Color(0xFF787878), fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < brandModelList.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) {
                              return ProductDetailsPage(
                                brandModelsData:
                                    brandModelList[i].brandModelsData,
                                ram: brandModelList[i].ram,
                                storage: brandModelList[i].storage,
                                color: brandModelList[i].color,
                              );
                            },
                          ),
                        );
                      },
                      onHorizontalDragUpdate: (dragUpdateDetails) {
                        setState(() {
                          selectedItemIdx = i;
                          xOffset += dragUpdateDetails.delta.dx;
                        });
                      },
                      onHorizontalDragEnd: (dragEndDetails) {
                        setState(() {
                          animate = true;
                          if (xOffset.abs() > maxXOffset) {
                            dragLimitExceed = true;
                          } else {
                            xOffset = 0.0;
                          }
                        });

                        if (dragLimitExceed) {
                          showProperDialog(context: context, index: i);
                        } else {
                          Future.delayed(Duration(milliseconds: 10), () {
                            dragLimitExceed = false;
                            itemRemoved = false;
                            xOffset = 0.0;
                            selectedItemIdx = -1;
                          });
                        }
                        Future.delayed(Duration(milliseconds: 100), () {
                          animate = false;
                        });
                      },

                      child: AnimatedSlide(
                        offset: (itemRemoved && i >= selectedItemIdx)
                            ? Offset(0.0, 1)
                            : ((i != selectedItemIdx)
                                  ? Offset(0.0, 0.0)
                                  : ((dragLimitExceed)
                                        ? Offset((xOffset < 0) ? -1 : 1, 0.0)
                                        : Offset(xOffset / cardWidth, 0.0))),
                        duration: (animate)
                            ? Duration(milliseconds: 300)
                            : Duration(milliseconds: 0),
                        curve: Curves.easeIn,
                        child: cartItemDetailsCard(brandModelList[i]),
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
