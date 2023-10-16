import 'package:flutter_dio/models/base_model.dart';
import 'package:flutter_dio/data/response/base_response_model.dart';

class Product extends BaseModel{
  String? name;
  String? category;
  double? price;
  String? orgId;
  String? productId;
  String? creationDate;
  bool? isActive;
  int? availableQuantity;
  String? revisionDate;

  Product(
      {this.name,
        this.category,
        this.price,
        this.orgId,
        this.productId,
        this.creationDate,
        this.isActive,
        this.availableQuantity,
        this.revisionDate});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    orgId = json['orgId'];
    productId = json['productId'];
    creationDate = json['creationDate'];
    isActive = json['isActive'];
    availableQuantity = json['availableQuantity'];
    revisionDate = json['revisionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['orgId'] = this.orgId;
    data['productId'] = this.productId;
    data['creationDate'] = this.creationDate;
    data['isActive'] = this.isActive;
    data['availableQuantity'] = this.availableQuantity;
    data['revisionDate'] = this.revisionDate;
    return data;
  }
}
