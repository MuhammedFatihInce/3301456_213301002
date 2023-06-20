
import 'package:deneme_flutter/data/dbHelper.dart';
import 'package:deneme_flutter/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class CategoryAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CategoryAddState();
  }

}

class CategoryAddState extends State{
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtCategoryId = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Kategori ekle"),
        ),
        body: Padding(
            padding: EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [buildNameField(), buildCategoryIdField(), buildSaveButton()
                ],
              ),
            )
        )
    );
  }

  TextField buildNameField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kategori adı"),
      controller: txtName,
    );
  }

  TextField buildCategoryIdField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kategori Id"),
      controller: txtCategoryId,
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
    var result = await dbHelper.categoryInsert(Category(name:txtName.text, categoryId: int.tryParse(txtCategoryId.text)!));
    Navigator.push(this.context, MaterialPageRoute(builder: (context)=>HomePage()));
  }



}