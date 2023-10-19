import 'package:flutter_dio/models/base_model.dart';
import 'package:flutter_dio/data/response/base_response_model.dart';

class Product {
  String? name;
  String? category;
  dynamic? price;
  String? orgId;
  String? productId;
  DateTime? creationDate;
  bool? isActive;
  int? availableQuantity;
  DateTime? revisionDate;

  Product(
      {name,
        category,
        price,
        orgId,
        productId,
        creationDate,
        isActive,
        availableQuantity,
        revisionDate});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'] ??"";
    category = json['category'] ??"";
    price = json['price'] ??0;
    orgId = json['orgId']  ??"";
    productId = json['productId']  ??"";
    isActive = json['isActive'] ??false;
    availableQuantity = json['availableQuantity'] ??0;
    revisionDate= DateTime.parse(json['revisionDate'] ?? "2023-10-05T10:20:51Z");
    creationDate= DateTime.parse(json['creationDate'] ?? "2023-10-05T10:20:51Z");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['category'] = category;
    data['price'] = price;
    data['orgId'] = orgId;
    data['productId'] = productId;
    data['creationDate'] = creationDate;
    data['isActive'] = isActive;
    data['availableQuantity'] = availableQuantity;
    data['revisionDate'] = revisionDate;
    return data;
  }
}
