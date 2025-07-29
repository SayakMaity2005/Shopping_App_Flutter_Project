import 'package:flutter/material.dart';
import 'global_data.dart';

class CartProvider extends ChangeNotifier {
  final List<MobileDetailsCart> cartItemList = [];

  void addItem(MobileDetailsCart item) {
    cartItemList.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    cartItemList.removeAt(index);
    notifyListeners();
  }
}