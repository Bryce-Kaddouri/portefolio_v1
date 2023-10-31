import 'package:flutter/material.dart';

class ChipApp extends StatelessWidget {
  String title;
  Widget? icon;
  ChipApp({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.red,
        shape: BoxShape.rectangle,

      ),
      padding: EdgeInsets.symmetric( vertical:8,horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon != null ? SizedBox(width: 8) : SizedBox(),
          icon ?? SizedBox(),

        ],
      )
    );
  }
}
