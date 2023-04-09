import 'package:flutter/material.dart';

Widget colorOption({required Color color, required bool selected, required final void  Function() onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color, border: Border.all(color: Color(0xFF0001FC), width: selected ? 3 : 0),),
      width: 23,
      height: 23,
    ),
  );
}