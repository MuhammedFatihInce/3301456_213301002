class Product {
   int? id;
   late String name;
    int? categoryId;
   late String description;
   late String photoUrl;
   late String unitPrice;

  Product(
      {required this.name, required this.categoryId, required this.description,required this.photoUrl, required this.unitPrice});

  Product.withId(
      {required this.id,
        required this.name,
        required this.categoryId,
        required this.description,
        required this.photoUrl,
        required this.unitPrice});

  Map<String,Object?> toMap(){
    var map = <String, dynamic>{};
    map["name"]=name;
    map["categoryId"]=categoryId;
    map["description"]=description;
    map["photoUrl"]=photoUrl;
    map["unitPrice"]=unitPrice;
    if(id!=null){
      map["id"]=id;
    }
    return map;
  }

  Product.fromObject(dynamic o){
    id =o["id"];
    name = o["name"];
    categoryId = o["categoryId"];
    description = o["description"];
    photoUrl = o["photoUrl"];
    unitPrice = o["unitPrice"];
  }

}
