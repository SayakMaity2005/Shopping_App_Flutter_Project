import 'package:flutter/material.dart';
import 'package:shopping_app/product_details_page.dart';
import 'global_data.dart';

class ProductLists extends StatelessWidget {
  final Brands brand;
  ProductLists({required this.brand, super.key});
  final Map<Brands, BrandData> brandList = {
    Brands.apple: BrandData(
      brandModelsData: appleModelsData,
      brandModels: appleModels,
    ),
    Brands.iQOO: BrandData(
      brandModelsData: iqooModelsData,
      brandModels: iqooModels,
    ),
  };

  // Extract link of image
  String brandImageLink(Brands brand, int modelIdx) {
    Mobile model = brandList[brand]!
        .brandModelsData[brandList[brand]!.brandModels[modelIdx]]!;
    String modelColor = model.defaultColor;
    String modelLink = model.colors[modelColor]!;
    return modelLink;
  }

  // Model enum to Model-name
  String brandName(Brands brand) {
    String brandName = brand.name;
    brandName =
        brandName.substring(0, 1).toUpperCase() + brandName.substring(1);
    return brandName;
  }

  @override
  Widget build(BuildContext context) {
    int? numCard = brandList[brand]?.brandModelsData.length;
    return Column(
      children: [
        Container(
          margin: EdgeInsetsGeometry.fromLTRB(10, 5, 10, 5),
          child: Text(
            brandName(brand),
            style: TextStyle(
              color: Color(0xFF454545),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if(numCard == null)
          Center(child: Text("No ${brandName(brand)} product available.", style: TextStyle(color: Color(0xFF666666)),),),
        if (numCard != null)
          for (int i = 0; i < numCard / 3 + 1; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                for (int j = 0; j < 3; j++)
                  if (3 * i + j < numCard)
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                final Mobile brandModelsData =
                                    brandList[brand]!
                                        .brandModelsData[brandList[brand]!
                                        .brandModels[3 * i + j]]!;
                                return ProductDetailsPage(
                                  brandModelsData: brandModelsData,
                                );
                              },
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsGeometry.symmetric(
                                horizontal: 5,
                              ),
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                // borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    brandImageLink(brand, (3 * i + j)),
                                    // : "assets/images/iPhone16ProMaxBlackTitanium.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsGeometry.fromLTRB(
                                10,
                                0,
                                10,
                                4,
                              ),
                              child: Text(
                                brandList[brand]!
                                    .brandModelsData[brandList[brand]!
                                        .brandModels[3 * i + j]]!
                                    .model[ModelVariant.modelName]!,
                                textAlign: TextAlign.center,
                                // softWrap: true,
                                // maxLines: 3,
                                // overflow: TextOverflow.visible,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
      ],
      //   ),
      // ),
    );
  }
}

class BrandData {
  final Map<String, Mobile> brandModelsData;
  final List<String> brandModels;
  const BrandData({required this.brandModelsData, required this.brandModels});
}
