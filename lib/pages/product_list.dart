import 'package:deneme_flutter/pages/productDetail.dart';
import 'package:deneme_flutter/pages/product_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dbHelper.dart';
import '../models/Product.dart';

class ProductList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }

}

class _ProductListState extends State{
  var dbHelper = DbHelper();
  late List<Product> products;
  int productCount = 0;

  @override
  void initState() {
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürün listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){goToProductAdd();},
        child: Icon(Icons.add),
        tooltip: "Yeni ürünh ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.black12,child: Image.asset(products[position].photoUrl),),
              title: Text(products[position].name),
              subtitle: Text(products[position].unitPrice!),
              onTap: (){goToDetail(products[position]);},
            ),
          );
        });
  }

  void goToProductAdd() async{
    bool result = await Navigator.push(this.context, MaterialPageRoute(builder: (context)=>ProductAdd()));
    if(result !=null){
      if(result) {
        getProducts();
      }
    }
  }

  void getProducts() async{
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data){
      setState(() {
        products = data;
        productCount = data.length;
      });
    });
  }

  void goToDetail(Product product) async{
    bool result = await Navigator.push(this.context, MaterialPageRoute(builder: (context)=>ProductDetailPage(product)));
    if(result!=null){
      if(result){
        getProducts();
      }
    }
  }
}
