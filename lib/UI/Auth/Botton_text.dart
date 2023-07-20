import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final bool loading;

  BottomText({required this.title, required this.ontap, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.deepPurple),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  )),
      ),
    );
  }
}
