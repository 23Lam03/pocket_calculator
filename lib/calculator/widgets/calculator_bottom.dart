import 'package:flutter/material.dart';

class CalculatorBottom extends StatelessWidget {
  CalculatorBottom({
    super.key,
    required this.title,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.amber,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
