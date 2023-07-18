import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Homepage/Home_page.dart';
import '../UI/Auth/Botton_text.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formkey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _Passwordcontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _Passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Signup",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                    controller: _emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                      controller: _Passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        }
                        return null;
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BottomText(
                ontap: () {
                  if (_formkey.currentState!.validate()) {
                    _auth.createUserWithEmailAndPassword(
                      email: _emailcontroller.text.toString(),
                      password: _Passwordcontroller.text.toString(),
                    );
                  }
                },
                title: "Sign up"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account ?"),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
