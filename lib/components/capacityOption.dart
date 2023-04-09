import 'package:flutter/material.dart';

Widget capacityOption({ required int capacity, required bool selected, required final void  Function() onPress}) {
  return  GestureDetector(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 23,),
      child: Text(
        "$capacity gb",
        style: TextStyle(
            fontSize: 16,
            color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE)),
      ),
    ),
  );
}