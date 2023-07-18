import 'package:flutter/material.dart';

import '../Firebase_Services/Splash_Services.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  Splashservices splash_screen = Splashservices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash_screen.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   elevation: 3,
      //   title: const Text(" Splash Screen"),
      // ),
      body: Center(
        child: Text(
          "Firebase App",
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
