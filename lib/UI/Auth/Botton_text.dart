import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String title;
  final VoidCallback ontap;

  const BottomText({
    required this.title,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.deepPurple),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
