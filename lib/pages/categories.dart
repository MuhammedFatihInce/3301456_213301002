import 'package:deneme_flutter/components/buildCategory.dart';
import 'package:deneme_flutter/pages/category.dart';
import 'package:deneme_flutter/components/bottomNavigation.dart';
import 'package:deneme_flutter/components/header.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smart objects",
    "Speakers",
    "Speakers",
    "Speakers",
    "Speakers",
    "Speakers",
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
            header("Categories", context),
            SizedBox(
              height: 16,
            ),
            //Kategoriler
            Expanded(
              child: ListView(
                  children: categories
                      .map((String title) => buildCategory(title, context))
                      .toList()),
            ),
          ],
        ),
      ),

      //BOTTOM NAVIGATION
      bottomNavigationBar("search"),
    ])));
  }
}
