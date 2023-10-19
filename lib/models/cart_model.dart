
import 'package:flutter_dio/models/res_product.dart';

import '../utils/my_application.dart';

class CartItem {
  final Product product;
  int _numOfItem;

  CartItem({required this.product, required int numOfItem})
      : _numOfItem = numOfItem;

  int get numOfItem => _numOfItem; // Getter to access the quantity
  set numOfItem(int value) {
    _numOfItem = value;
  }
}

// Demo data for our cart


