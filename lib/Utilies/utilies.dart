import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utilies {
  void toastMessages(String Message) {
    Fluttertoast.showToast(
        msg: Message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        fontSize: 30,
        textColor: Colors.white);
  }
}
