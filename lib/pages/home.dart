import 'package:deneme_flutter/components/buildBanner.dart';
import 'package:deneme_flutter/components/buildHeader.dart';
import 'package:deneme_flutter/components/buildNavigation.dart';
import 'package:deneme_flutter/components/buildSalesItem.dart';
import 'package:deneme_flutter/models/Product.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import '../components/bottomNavigation.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> product = [
    Product.withId(
        id: 1,
        name: 'Grocery \n& Staples',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 2,
        name: 'Iphone',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 3,
        name: 'Laptop ',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 4,
        name: 'Pc ',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 5,
        name: 'Fırın',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 6,
        name: 'Grocery \n& Staples',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 7,
        name: 'Grocery \n& Staples',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
    Product.withId(
        id: 8,
        name: 'Grocery \n& Staples',
        photoUrl: "assets/images/Grocery&Staples.png",
        discount: "-50%"),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Başlık
                    buildHeader(),

                    //Banner
                    buildBanner(),

                    //Butonlar
                    Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //ilk eleman
                          buildNavigation(
                              text: "Categories",
                              icon: Icons.menu,
                              widget: CategoriesPage(),
                              context: context),
                          buildNavigation(
                              text: "Favorites",
                              icon: Icons.star_border,
                              widget: Container(),
                              context: context),
                          buildNavigation(
                              text: "Gifts",
                              icon: Icons.card_giftcard,
                              widget: Container(),
                              context: context),
                          buildNavigation(
                              text: "Best selling",
                              icon: Icons.people,
                              widget: Container(),
                              context: context),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),
                    // SALES TİTLE
                    Text(
                      "Sales",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    //SALES ITEMS
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:[
                      buildSalesItem(
                        text:"${product[0].name}",
                        photoUrl:"${product[0].photoUrl}",
                        discount:"${product[0].discount}",
                        screenWidth:screenWidth,
                      ),
                      buildSalesItem(
                        text:"${product[1].name}",
                        photoUrl:"${product[1].photoUrl}",
                        discount:"${product[1].discount}",
                        screenWidth:screenWidth,
                      ),
                      buildSalesItem(
                        text:"${product[2].name}",
                        photoUrl:"${product[2].photoUrl}",
                        discount:"${product[2].discount}",
                        screenWidth:screenWidth,
                      ),
                      buildSalesItem(
                        text:"${product[3].name}",
                        photoUrl:"${product[3].photoUrl}",
                        discount:"${product[3].discount}",
                        screenWidth:screenWidth,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:[
                      buildSalesItem(
                        text:"${product[0].name}",
                        photoUrl:"${product[0].photoUrl}",
                        discount:"${product[0].discount}",
                        screenWidth:screenWidth,
                      ),
                      buildSalesItem(
                        text:"${product[1].name}",
                        photoUrl:"${product[1].photoUrl}",
                        discount:"${product[1].discount}",
                        screenWidth:screenWidth,
                      ),
                      buildSalesItem(
                        text:"${product[2].name}",
                        photoUrl:"${product[2].photoUrl}",
                        discount:"${product[2].discount}",
                        screenWidth:screenWidth,
                      ),
                      buildSalesItem(
                        text:"${product[3].name}",
                        photoUrl:"${product[3].photoUrl}",
                        discount:"${product[3].discount}",
                        screenWidth:screenWidth,
                      ),
                    ],
                  ),
                ),


                  SizedBox(
                      height: 55,
                    ),
                  ],
                ),
              ),
            ),

            //BOTTOM NAVIGATION BAR
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildfor(List<Product> product, double screenWidth) {
  List<Widget> salesItem = [];
  for (int i = 0; i < product.length; i++) {
    salesItem = [
      buildSalesItem(
        text: "${product[i].name}",
        photoUrl: "${product[i].photoUrl}",
        discount: "${product[i].discount}",
        screenWidth: screenWidth,
      )
    ];
  }
  return salesItem.toList();
}
