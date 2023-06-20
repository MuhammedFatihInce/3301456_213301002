import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dbHelper.dart';
import '../models/Product.dart';
import 'home.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State{
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtCategoryId = TextEditingController();
  var txtDescription = TextEditingController();
  var txtPhotoUrl = TextEditingController();
  var txtUnitPrice = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni ürün ekle"),
        ),
        body: Padding(
            padding: EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [buildNameField(), buildCategoryIdField(), buildDescriptionField(), buildPhotoUrlField(),buildDiscountField(),buildSaveButton()
                ],
              ),
            )
        )
    );
  }

  TextField buildNameField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Ürün adı"),
      controller: txtName,
    );
  }

  TextField buildCategoryIdField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kategori Id"),
      controller: txtCategoryId,
    );
  }

  TextField buildDescriptionField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Ürün açıklaması"),
      controller: txtDescription,
    );
  }

  TextField buildPhotoUrlField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Ürün Resmi"),
      controller: txtPhotoUrl,
    );
  }

  TextField buildDiscountField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Birim fiyatı"),
      controller: txtUnitPrice,
    );
  }

  TextButton buildSaveButton() {
    return TextButton(
      child: Text("Ekle"),
      onPressed: (){
        addProduct();
      },
    );
  }

  void addProduct() async{
    var result = await dbHelper.insert(Product(name:txtName.text, photoUrl: txtPhotoUrl.text, unitPrice: txtUnitPrice.text, categoryId: int.tryParse(txtCategoryId.text)!, description: txtDescription.text));
    Navigator.push(this.context, MaterialPageRoute(builder: (context)=>HomePage()));
  }



}