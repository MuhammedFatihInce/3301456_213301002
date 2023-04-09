import 'package:flutter/material.dart';

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0XFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}