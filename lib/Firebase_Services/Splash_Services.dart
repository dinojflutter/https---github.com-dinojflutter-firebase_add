import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_new1/Pages/post_screen.dart';

import 'package:flutter/material.dart';

import '../Homepage/Login_screen.dart';

class Splashservices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;

    if (auth != null) {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Postscreen())));
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Loginscreen())));
    }
  }
}
