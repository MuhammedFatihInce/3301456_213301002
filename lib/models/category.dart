class Category {
  int? id;
  int? categoryId;
  late String name;


  Category(
      {required this.name, required this.categoryId});

  Category.withId({required this.id,
    required this.categoryId,
    required this.name,
  });

  Map<String,Object?> toMap(){
    var map = <String, dynamic>{};
    map["categoryId"]=categoryId;
    map["name"]=name;
    if(id!=null){
      map["id"]=id;
    }
    return map;
  }

  Category.fromObject(dynamic o){
    id =o["id"]!;
    categoryId =o["categoryId"];
    name = o["name"];
  }

}