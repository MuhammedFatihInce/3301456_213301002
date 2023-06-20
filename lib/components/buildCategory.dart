import 'package:deneme_flutter/pages/category.dart';
import 'package:deneme_flutter/models/category.dart';
import 'package:flutter/material.dart';

Widget buildCategory(Category category, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(category);
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(0, 4))
        ],
      ),
      child: Text(
        category.name,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF0A1034)),
      ),
    ),
  );
}