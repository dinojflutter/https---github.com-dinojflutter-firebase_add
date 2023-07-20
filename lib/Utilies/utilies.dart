import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utilies {
  void toastMessages(String Message) {
    Fluttertoast.showToast(
        msg: Message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        fontSize: 18,
        textColor: Colors.white);
  }
}
