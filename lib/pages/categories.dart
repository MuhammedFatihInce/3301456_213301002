import 'package:deneme_flutter/components/backButton.dart';
import 'package:deneme_flutter/components/buildCategory.dart';
import 'package:deneme_flutter/components/bottomNavigation.dart';
import 'package:deneme_flutter/components/header.dart';
import 'package:deneme_flutter/models/category.dart';
import 'package:flutter/material.dart';

import '../data/dbHelper.dart';


class CategoriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoriesPageState();
  }

}

class _CategoriesPageState extends State{
    var dbHelper = DbHelper();
     List<Category> categories=[];
    int categoryCount = 0;

    @override
    void initState() {
      super.initState();
      getCategories();
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
                      header("Kategoriler"),
                      SizedBox(
                        height: 16,
                      ),
                      //Kategoriler
                      Expanded(
                        child: ListView(
                            children: categories
                                .map((Category category) => buildCategory(category, context))
                                .toList()),
                      ),
                    ],
                  ),
                ),

                //BOTTOM NAVIGATION
                bottomNavigationBar("search", context),
              ])));
    }

    void getCategories() async {
      var productsFuture = dbHelper.getCategories();
      productsFuture.then((data) {
        setState(() {
          categories = data;
          categoryCount = data.length;
        });
      });
    }
  }





