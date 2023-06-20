import 'package:flutter/material.dart';

Widget header(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  SizedBox(
  height: 24,
  ),

  Text(
 title,
  style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Color(0xFF0A1034)),
  ),
    ],
  );

}