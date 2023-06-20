import 'package:deneme_flutter/pages/productDetail.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

Widget buildContent(Product product, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(product);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Image.asset(
            product.photoUrl, height: 60, width: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 42,
              ),
              Text(
                product.name,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                " ${product.unitPrice} TL",
                style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ),
  );
}