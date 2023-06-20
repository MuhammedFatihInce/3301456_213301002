import 'package:deneme_flutter/models/Product.dart';
import 'package:flutter/cupertino.dart';

class Cart {
   int? id;
  late  String productId;
  late String productName;
   int? initialPrice;
   int? productPrice;
   ValueNotifier<int>? quantity;
  late String image;

  Cart(
      {
        required this.productId,
        required this.productName,
        required this.initialPrice,
        required this.productPrice,
        required this.quantity,
        required this.image});

  Cart.withIdCart(
      {required this.id,
        required this.productId,
        required this.productName,
        required this.initialPrice,
        required this.productPrice,
        required this.quantity,
        required this.image});

  Map<String,Object?> toMap(){
    var map = <String, dynamic>{};
    map["productId"]=productId;
    map["productName"]=productName;
    map["initialPrice"]=initialPrice;
    map["productPrice"]=productPrice;
    map["quantity"]=quantity?.value;
    map["image"]=image;
    if(id!=null){
      map["id"]=id;
    }
    return map;
  }

  Cart.fromObject(dynamic o){
    id =o["id"];
    productId = o["productId"];
    productName  = o["productName"];
    initialPrice  = o["initialPrice"];
    productPrice  = o["productPrice"];
    quantity  =ValueNotifier(o['quantity']);
    image = o['image'];
  }

   Map<String, dynamic> quantityMap() {
     return {
       'productId': productId,
       'quantity': quantity!.value,
     };
   }
}