import 'package:deneme_flutter/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dbHelper.dart';
import '../models/Product.dart';

class ProductUpdate extends StatefulWidget{

  Product product;
  ProductUpdate(this.product);

  @override
  State<StatefulWidget> createState() {

    return _ProductUpdateState(product);
  }

}

enum Options{delete,update}

class _ProductUpdateState extends State{
  Product product;
  _ProductUpdateState(this.product);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtCategoryId = TextEditingController();
  var txtDescription = TextEditingController();
  var txtPhotoUrl = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name;
    txtCategoryId.text = product.categoryId.toString();
    txtDescription.text = product.description;
    txtPhotoUrl.text = product.photoUrl;
    txtUnitPrice.text = product.unitPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün detayı : ${product.name}"),
      ),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {
    return Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [buildNameField(), buildCategoryIdField(), buildDescriptionField(), buildPhotoUrlField(),buildUnitPriceField(),buildSaveButton()
            ],
          ),
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

  TextField buildUnitPriceField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Birim fiyatı"),
      controller: txtUnitPrice,
    );
  }

  TextButton buildSaveButton() {
    return TextButton(
      child: Text("Güncelle"),
      onPressed: (){
        updateProduct();
      },
    );
}

  void updateProduct() async{
    await dbHelper.update(Product.withId(id: product.id, name: txtName.text, photoUrl: txtPhotoUrl.text, unitPrice: txtUnitPrice.text, categoryId: int.tryParse(txtCategoryId.text), description: txtDescription.text));
    Navigator.push(this.context, MaterialPageRoute(builder: (context)=>HomePage()));

  }
}