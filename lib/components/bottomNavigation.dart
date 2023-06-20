

import 'package:deneme_flutter/pages/home.dart';
import 'package:deneme_flutter/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../pages/cart_screen.dart';
import '../pages/chart_page.dart';
import '../pages/wishList_screen.dart';
import '../pages/categories.dart';
import '../pages/category_list.dart';

Widget bottomNavigationBar(String page, BuildContext context){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, -3),
          color: Colors.black.withOpacity(0.25),
          blurRadius: 10,
        )
      ],
        color: Color(0XFFEFF5FB),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(iconData: Icons.home_filled, active: page == "home", context: context, widget: HomePage()),
          buildNavIcon(iconData: Icons.bar_chart, active: page == "chart", context: context, widget: ChartPage()),
          buildNavIcon(
              iconData: Icons.shopping_basket, active: page == "cart", context: context, widget: CartScreen()),
          buildNavIcon(iconData: Icons.person, active: page == "profile", context: context, widget: WelcomeScreen()),
        ],
      ),
    ),
  );
}

Widget buildNavIcon({required IconData iconData, required bool active, required BuildContext context,  required Widget widget}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Icon(
      iconData,
      size: 20,
      color: Color(active ? 0xFF0001FC : 0xFF0A1034),
    ),
  );
}