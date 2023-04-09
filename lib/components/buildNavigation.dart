import 'package:flutter/material.dart';

Widget buildNavigation({
  required String text,
  required IconData icon,
  required Widget widget,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0XFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0XFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Color(0XFF1F53E4),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}