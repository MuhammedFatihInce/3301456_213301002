import 'package:flutter/material.dart';

Widget buildBanner() {
  return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration(
            color: Color(0XFF0001FC), borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enjoy the special \noffer upto 30%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "USD 279",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Image.asset("assets/images/vegtables.png", width: 120)
          ],
        ),
      ));
}