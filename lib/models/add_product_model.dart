class AddProduct {
  String? name;
  String? category;
  double? price;
  int? availableQuantity;
  String? orgId;

  AddProduct(
      {this.name,
        this.category,
        this.price,
        this.availableQuantity,
        this.orgId});

  AddProduct.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    availableQuantity = json['availableQuantity'];
    orgId = json['orgId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['availableQuantity'] = this.availableQuantity;
    data['orgId'] = this.orgId;
    return data;
  }
}
