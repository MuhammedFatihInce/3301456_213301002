import 'package:deneme_flutter/components/buildBanner.dart';
import 'package:deneme_flutter/components/buildHeader.dart';
import 'package:deneme_flutter/components/buildNavigation.dart';
import 'package:deneme_flutter/components/buildSalesItem.dart';
import 'package:deneme_flutter/models/Product.dart';
import 'package:deneme_flutter/pages/category_list.dart';
import 'package:deneme_flutter/pages/product_add.dart';
import 'package:deneme_flutter/pages/product_list.dart';

import 'package:flutter/material.dart';

import '../data/dbHelper.dart';
import 'wishList_screen.dart';
import 'categories.dart';
import '../components/bottomNavigation.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> campaigns = [buildBanner(), buildBanner(), buildBanner()];
  int newIndex = 0;



  var dbHelper = DbHelper();
  late List<Product> products;
  int productCount = 0;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

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
                    Stack(
                      children: [
                        SizedBox(
                          height: 210,
                          child: PageView.builder(
                            controller: PageController(initialPage: 0),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return campaigns[index];
                            },
                            onPageChanged: (index) {
                              setState(() {
                                newIndex = index;
                              });
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int i = 0; i < campaigns.length; i++)
                                  Container(
                                    width: 8,
                                    height: 8,
                                    margin: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: newIndex == i
                                          ? Colors.blue
                                          : Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //buildBanner(),

                    //Butonlar
                    Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //ilk eleman
                          buildNavigation(
                              text: "Kategoriler",
                              icon: Icons.menu,
                              widget: CategoriesPage(),
                              context: context),
                          buildNavigation(
                              text: "Ürün Listesi",
                              icon: Icons.list_alt_outlined,
                              widget: ProductList(),
                              context: context),
                          buildNavigation(
                              text: "Kategori Listesi",
                              icon: Icons.system_update_alt_rounded,
                              widget: CategoryList(),
                              context: context),
                          buildNavigation(
                              text: "İstek Listesi",
                              icon: Icons.bookmark,
                              widget: WishListScreen(),
                              context: context),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),
                    // SALES TİTLE
                    Text(
                      "İndirimde olanlar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    //SALES ITEMS
                    SizedBox(
                      height: 270,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 20,
                          ),
                          itemCount: productCount,
                          padding: EdgeInsets.only(
                              left: 10, top: 20, right: 20, bottom: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildSalesItem(
                              product: products[index],
                              context: context,
                              screenWidth: screenWidth,
                            );
                          }),
                    ),

                    SizedBox(
                      height: 270,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 20,
                          ),
                          itemCount: productCount,
                          padding: EdgeInsets.only(
                              left: 10, top: 20, right: 20, bottom: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildSalesItem(
                              product: products[index],
                              context: context,
                              screenWidth: screenWidth,
                            );
                          }),
                    ),

                    SizedBox(
                      height: 55,
                    ),
                  ],
                ),
              ),
            ),

            //BOTTOM NAVIGATION BAR
            bottomNavigationBar("home", context),
          ],
        ),
      ),
    );
  }

  void getProducts() async {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
        products = data;
        productCount = data.length;
      });
    });
  }



}
