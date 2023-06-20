import 'package:deneme_flutter/components/buildNavigation.dart';
import 'package:deneme_flutter/components/label.dart';
import 'package:deneme_flutter/pages/productDetail.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

Widget buildSalesItem({
  required Product product,
  required double screenWidth,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(product);
      }));
    },
    child: Card(
      child: Container(
        width: (screenWidth - 60) * 0.5,
        padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label("new"),
            SizedBox(
              height: 22,
            ),
            Center(child: Image.asset(product.photoUrl, width: 60, height: 60,)),
            SizedBox(
              height: 22,
            ),
            Center(
                child: Text(product.name,
                    style: TextStyle(fontSize: 18, color: Color(0XFF0A1034)))),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.unitPrice} TL",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

