class Dispatch {
  String? orgId;
  String? dispatchId;
  String? recordId;

  String? productId;
  String? dispatchToOrganisation;
  int? actualPrice;
  int? salePrice;
  int? discountedPrice;
  int? dispatchedQuantity;
  int? acceptedQuantity;
  String? acceptedByName;
  
  
  DateTime? acceptedDate;
  DateTime? revisionDate;
  DateTime? creationDate;
  
  
  Dispatch(
      {orgId,
        dispatchId,
        recordId,
        creationDate,
        productId,
        dispatchToOrganisation,
        actualPrice,
        salePrice,
        discountedPrice,
        dispatchedQuantity,
        acceptedQuantity,
        acceptedByName,
        acceptedDate,
        revisionDate});

  Dispatch.fromJson(Map<String, dynamic> json) {
    orgId = json['orgId'] ?? "";
    dispatchId = json['dispatchId']?? "";
    recordId = json['recordId']?? "";
    productId = json['productId']?? "";
    dispatchToOrganisation = json['dispatchToOrganisation'] ?? "";
    actualPrice = json['actualPrice']?? 0;
    salePrice = json['salePrice']?? 0;
    discountedPrice = json['discountedPrice']?? 0;
    dispatchedQuantity = json['dispatchedQuantity']?? 0;
    acceptedQuantity = json['acceptedQuantity']?? 0;
    acceptedByName = json['acceptedByName']?? "";
    acceptedDate= DateTime.parse(json['acceptedDate'] ?? "2023-10-05T10:20:51Z") ;
    revisionDate= DateTime.parse(json['revisionDate'] ?? "2023-10-05T10:20:51Z");
    creationDate= DateTime.parse(json['creationDate'] ?? "2023-10-05T10:20:51Z");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['orgId'] = orgId;
    data['dispatchId'] = dispatchId;
    data['recordId'] = recordId;
    data['creationDate'] = creationDate;
    data['productId'] = productId;
    data['dispatchToOrganisation'] = dispatchToOrganisation;
    data['actualPrice'] = actualPrice;
    data['salePrice'] = salePrice;
    data['discountedPrice'] = discountedPrice;
    data['dispatchedQuantity'] = dispatchedQuantity;
    data['acceptedQuantity'] = acceptedQuantity;
    data['acceptedByName'] = acceptedByName;
    data['acceptedDate'] = acceptedDate;
    data['revisionDate'] = revisionDate;
    return data;
  }


}
