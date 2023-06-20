import 'package:deneme_flutter/components/backButton.dart';
import 'package:deneme_flutter/components/bottomNavigation.dart';
import 'package:deneme_flutter/components/buildContext.dart';
import 'package:deneme_flutter/components/header.dart';
import 'package:deneme_flutter/pages/home.dart';
import 'package:flutter/material.dart';

import '../data/dbHelper.dart';
import '../models/Product.dart';
import '../models/category.dart';

class CategoryPage extends StatefulWidget {
  Category category;
  CategoryPage(this.category);

  @override
  State<StatefulWidget> createState() {
   return _CategoryPage(category);
  }

}

class _CategoryPage extends State{
  Category category;
  _CategoryPage(this.category);

  var dbHelper = DbHelper();
   List<Product> products=[];
  List<Widget> productWidgets = [];
  int productCount = 0;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //HEADER
                      SizedBox(
                        height: 29,
                      ),
                      //Geri İkonu
                      backButton(context),
                      header(category.name),

                      SizedBox(
                        height: 32,
                      ),

                      //ICERIKLER

                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          children: productWidgets.toList(),
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],

                  )),


              //BOTTOM NAVİGATİON
              bottomNavigationBar("search",context),
            ])));
  }

  void getProducts() async {
    var productsFuture = dbHelper.getProductsCategoryId(category.categoryId);
    productsFuture.then((data) {
      setState(() {
        products = data;
        productCount = data.length;
        getProductWidgets();
      });
    });
  }

  List<Widget> getProductWidgets() {
    for(int i=0;i<products.length;i++){
      productWidgets.add(getProductWidget(products[i]));
    }
    return productWidgets;
  }

  Widget getProductWidget(Product product) {
    return buildContent(product, context);
  }


}


