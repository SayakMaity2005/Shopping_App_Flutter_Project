import 'package:flutter/material.dart';
import 'global_data.dart';

class ProductDetailsFormat extends StatelessWidget {
  final Mobile brandModel;
  ProductDetailsFormat({required this.brandModel, super.key});

  final Map<String, String> dynamicFeatures = {
    "Color": "color",
    "RAM": "ram",
    "Storage": "storage",
  };

  Widget allDetailsFormatCreator({required String key, required String value}) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$key :  ",
            style: TextStyle(
              color: Color(0xFF005568),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: Text(
              value,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: TextStyle(color: Color(0xFF3E3E3E), fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamicFeatures["Color"] = brandModel.defaultColor;
    dynamicFeatures["RAM"] = "${brandModel.defaultRam} GB";
    dynamicFeatures["Storage"] = (brandModel.defaultStorage >= 1024)
        ? "${brandModel.defaultStorage ~/ 1024} TB"
        : "${brandModel.defaultStorage} GB";
    return Column(
      children: [
        Container(
          margin: EdgeInsetsGeometry.fromLTRB(0, 20, 0, 4),
          child: Text(
            "All Details",
            style: TextStyle(
              color: Color(0xFF4C4C4C),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for(final entry in dynamicFeatures.entries)
          allDetailsFormatCreator(key: entry.key, value: entry.value),
        for (final entry in brandModel.features.entries)
          allDetailsFormatCreator(key: entry.key, value: entry.value),
      ],
    );
  }
}
