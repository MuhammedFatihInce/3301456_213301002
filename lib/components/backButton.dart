

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context){
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Icon(
      Icons.arrow_back,
      color: Color(0xFF0A1034),
      size: 27,
    ),
  );
}