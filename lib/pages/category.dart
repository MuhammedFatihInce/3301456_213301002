import 'package:deneme_flutter/components/bottomNavigation.dart';
import 'package:deneme_flutter/components/buildContext.dart';
import 'package:deneme_flutter/components/header.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Surface laptop 3",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Iphone 11 Pro",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Mackbook",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Başka bişey",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 7",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/Grocery&Staples.png",
      "fiyat": "999"
    },
  ];

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
              header(categoryTitle, context),

              SizedBox(
                height: 32,
              ),

              //ICERIKLER

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  children: products.map((Map product) {
                    return buildContent(product["isim"], product["fotograf"],
                        product["fiyat"], context);
                  }).toList(),
                ),
              ),
              SizedBox(height: 50,),
            ],

          )),


      //BOTTOM NAVİGATİON
      bottomNavigationBar("search"),
    ])));
  }
}
