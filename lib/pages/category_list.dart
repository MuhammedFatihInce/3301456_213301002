import 'package:deneme_flutter/data/dbHelper.dart';
import 'package:deneme_flutter/models/category.dart';
import 'package:deneme_flutter/pages/category_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'category_add.dart';

class CategoryList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CategoryListState();
  }

}

class _CategoryListState extends State{
  var dbHelper = DbHelper();
  late List<Category> categories;
  int categoryCount = 0;

  @override
  void initState() {
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori listesi"),
      ),
      body: buildCategoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){goToCategoryAdd();},
        child: Icon(Icons.add),
        tooltip: "Yeni kategori ekle",
      ),
    );
  }

  ListView buildCategoryList() {
    return ListView.builder(
        itemCount: categoryCount,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(categories[position].name),
              subtitle: Text(categories[position].categoryId.toString()),
              onTap: (){goToCategoryDetail(categories[position]);},
            ),
          );
        });
  }

  void goToCategoryAdd() async{
    bool result = await Navigator.push(this.context, MaterialPageRoute(builder: (context)=>CategoryAdd()));
    if(result !=null){
      if(result) {
        getCategories();
      }
    }
  }

  void getCategories() async{
    var productsFuture = dbHelper.getCategories();
    productsFuture.then((data){
      setState(() {
        categories = data;
        categoryCount = data.length;
      });
    });
  }

  void goToCategoryDetail(Category category) async{
    bool result = await Navigator.push(this.context, MaterialPageRoute(builder: (context)=>CategoryUpdate(category)));
    if(result!=null){
      if(result){
        getCategories();
      }
    }
  }
}
