import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/product_details_format.dart';

import 'global_data.dart';

class ProductDetailsPage extends StatefulWidget {
  final Mobile brandModelsData;
  final int? ram;
  final int? storage;
  final String? color;

  const ProductDetailsPage({
    required this.brandModelsData,
    this.ram,
    this.storage,
    this.color,
    super.key,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late Mobile brandModel;
  bool imageLoaded = false;
  bool wrongChoice = false;
  int countLoading = 0;

  // Color Select Format Method
  Widget colorSelect(String color, String link) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(link)),
          ),
        ),
        Container(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          width: 80,
          child: Text(
            color,
            softWrap: true,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF424242)),
          ),
        ),
      ],
    );
  }

  // Alert banner
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> alertBanner(
    String alert,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          alert,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF770426), fontSize: 18),
        ),
        backgroundColor: Color(0xD8E49BA8),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Confirmation banner
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> confirmationBanner(
    String message,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF023151), fontSize: 18),
        ),
        backgroundColor: Color(0xD89BD1E4),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        margin: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Price Format Method
  String priceFormatter(Mobile brandModel) {
    String priceKey = "${brandModel.defaultRam}-${brandModel.defaultStorage}";
    String priceFormat;
    if (brandModel.priceVariant.containsKey(priceKey)) {
      int price = brandModel.priceVariant[priceKey]!;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brandModel = widget.brandModelsData;
    if(widget.ram != null) brandModel.defaultRam = widget.ram!;
    if(widget.storage != null) brandModel.defaultStorage = widget.storage!;
    if(widget.color != null) brandModel.defaultColor = widget.color!;
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
          "Product Details",
          style: TextStyle(color: Color(0xFF373737)),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                brandModel.model[ModelVariant.modelName]!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF005A67),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Image show
              Container(
                margin: EdgeInsetsGeometry.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 400,
                width: 310,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  // "https://drive.google.com/uc?export=view&id=1tMvc3lh8FSs6gf8hIaGzLxUpE91MwKsV",
                  brandModel.colors[brandModel.defaultColor]!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Center(
                        child: Text(
                          "Image Load Error",
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Price Container
              Container(
                margin: EdgeInsetsGeometry.fromLTRB(20, 10, 0, 10),
                alignment: AlignmentGeometry.directional(-1, 1),
                child: Text(
                  priceFormatter(brandModel),
                  style: TextStyle(
                    color: Color(0xFF148F77),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Color Variant
              Container(
                margin: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 6),
                child: Text(
                  brandModel.defaultColor,
                  style: TextStyle(
                    color: Color(0xFF012F5A),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Color variant Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    for (final entry in brandModel.colors.entries)
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            brandModel.defaultColor = entry.key;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: (entry.key == brandModel.defaultColor)
                                ? BoxBorder.all(
                                    color: Color(0xFF4C4C4C),
                                    width: 2,
                                  )
                                : BoxBorder.all(
                                    color: Color(0xFFA5A5A5),
                                    width: 2,
                                  ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: colorSelect(entry.key, entry.value),
                        ),
                      ),
                  ],
                ),
              ),
              // RAM Select Row
              Container(
                margin: EdgeInsetsGeometry.fromLTRB(0, 18, 0, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Text(
                      "RAM : ",
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    for (final int ram in brandModel.ramVariants)
                      GestureDetector(
                        onTap: () {
                          String priceKey = "$ram-${brandModel.defaultStorage}";
                          if (!brandModel.priceVariant.containsKey(priceKey)) {
                            wrongChoice = true;
                            alertBanner("This combination Does not exist.");
                          } else {
                            wrongChoice = false;
                          }
                          setState(() {
                            brandModel.defaultRam = ram;
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          surfaceTintColor: (ram == brandModel.defaultRam)
                              ? Color(0xFF00B9F1)
                              : Colors.transparent,
                          shadowColor: (ram == brandModel.defaultRam)
                              ? Color(0xFF00B9F1)
                              : Color(0xFF3C3C3C),
                          elevation: (ram == brandModel.defaultRam) ? 3 : 2,
                          child: Container(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            child: Text(
                              "${ram.toString()} GB",
                              style: TextStyle(
                                color: Color(0xFF515151),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Storage Row
              Container(
                margin: EdgeInsetsGeometry.symmetric(vertical: 6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 2,
                    children: [
                      Text(
                        "Storage : ",
                        style: TextStyle(
                          color: Color(0xFF4C4C4C),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      for (final int storage in brandModel.storageVariants)
                        GestureDetector(
                          onTap: () {
                            String priceKey =
                                "${brandModel.defaultRam}-$storage";
                            if (!brandModel.priceVariant.containsKey(
                              priceKey,
                            )) {
                              wrongChoice = true;
                              alertBanner("This combination Does not exist.");
                            } else {
                              wrongChoice = false;
                            }
                            setState(() {
                              brandModel.defaultStorage = storage;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            surfaceTintColor:
                                (storage == brandModel.defaultStorage)
                                ? Color(0xFF00B9F1)
                                : Colors.transparent,
                            shadowColor: (storage == brandModel.defaultStorage)
                                ? Color(0xFF00B9F1)
                                : Color(0xFF3C3C3C),
                            elevation: (storage == brandModel.defaultStorage)
                                ? 3
                                : 2,
                            child: Container(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: Text(
                                (storage >= 1024)
                                    ? "${storage ~/ 1024} TB"
                                    : "$storage GB",
                                style: TextStyle(
                                  color: Color(0xFF515151),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ProductDetailsFormat(brandModel: brandModel),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsetsGeometry.fromLTRB(80, 8, 80, 16),
        child: ElevatedButton(
          onPressed: () {
            if (wrongChoice) {
              alertBanner("This combination Does not exist.");
              return;
            }
            Provider.of<CartProvider>(context, listen: false).addItem(
              MobileDetailsCart(
                brandModelsData: brandModel,
                ram: brandModel.defaultRam,
                storage: brandModel.defaultStorage,
                color: brandModel.defaultColor,
              ),
            );
            confirmationBanner("Item added successfully.");
          },
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Color(0xFF00FFB9),
            elevation: 2,
            shadowColor: Color(0xFF00FFB9),
            overlayColor: Color(0xFF87DDC4),
          ),
          child: Text(
            "Add to Cart",
            style: TextStyle(color: Color(0xFF634F77), fontSize: 20),
          ),
        ),
      ),
    );
  }
}
