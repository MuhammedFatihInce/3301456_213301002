import 'package:deneme_flutter/models/category.dart';
import 'package:deneme_flutter/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dbHelper.dart';

class CategoryUpdate extends StatefulWidget{

  Category category;
  CategoryUpdate(this.category);

  @override
  State<StatefulWidget> createState() {

    return _CategoryUpdateState(category);
  }

}

enum Options{delete}
class _CategoryUpdateState extends State{
  Category category;
  _CategoryUpdateState(this.category);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtCategoryId = TextEditingController();

  @override
  void initState() {
    txtName.text = category.name;
    txtCategoryId.text = category.categoryId.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("Sil"),
              ),
            ],
          )
        ],
        title: Text("Kategori detayı : ${category.name}"),
      ),
      body: buildCategoryDetail(),
    );
  }

  buildCategoryDetail() {
    return Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [buildNameField(), buildCategoryIdField(), buildSaveButton()
            ],
          ),
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
      child: Text("Güncelle"),
      onPressed: (){
        updateProduct();
      },
    );
  }

  void updateProduct() async{
    await dbHelper.categoryUpdate(Category.withId(id: category.id, name: txtName.text, categoryId: int.tryParse(txtCategoryId.text)!));
    Navigator.push(this.context, MaterialPageRoute(builder: (context)=>HomePage()));

  }

  void selectProcess(Options options) async{
    switch(options){
      case Options.delete:
        await dbHelper.delete(category.id);
        Navigator.push(this.context, MaterialPageRoute(builder: (context)=>HomePage()));
        break;
      default:
    }
  }
}