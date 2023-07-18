import 'dart:async';

import 'package:flutter/material.dart';

import '../Homepage/Home_page.dart';

class Splashservices {
  void islogin(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Homepage())));
  }
}
