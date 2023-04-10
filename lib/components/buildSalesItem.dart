import 'package:deneme_flutter/components/buildNavigation.dart';
import 'package:deneme_flutter/components/label.dart';
import 'package:deneme_flutter/pages/productDetail.dart';
import 'package:flutter/material.dart';

Widget buildSalesItem({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenWidth,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(text, photoUrl);
      }));
    },
    child: Card(
      child: Container(
        width: (screenWidth - 60) * 0.5,
        padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label(discount),
            SizedBox(
              height: 22,
            ),
            Center(child: Image.asset(photoUrl)),
            SizedBox(
              height: 22,
            ),
            Center(
                child: Text(text,
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
                      "100 TL",
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

