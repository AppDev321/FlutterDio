
import 'package:flutter_dio/models/res_product.dart';

import '../utils/my_application.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: app.appController.productList[0], numOfItem: 2),
  Cart(product: app.appController.productList[1], numOfItem: 1),
 // Cart(product: demoProducts[3], numOfItem: 1),
];
