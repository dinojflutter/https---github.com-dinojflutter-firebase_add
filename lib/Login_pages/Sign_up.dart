import 'package:firebase_new1/Utilies/utilies.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Homepage/Login_screen.dart';
import '../UI/Auth/Botton_text.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formkey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  // Future<void> _signUp() async {
  //   try {
  //     if (_formkey.currentState!.validate()) {

  //       UserCredential userCredential =
  //           await _auth.createUserWithEmailAndPassword(
  //         email: _emailcontroller.text.trim(),
  //         password: _passwordcontroller.text.trim(),
  //       );

  //       // Check if the user already exists
  //       if (userCredential.additionalUserInfo?.isNewUser == false) {
  //         showDialog(
  //           context: context,
  //           builder: (context) => AlertDialog(
  //             backgroundColor: Colors.red,
  //             title: const Text('Email Already Registered'),
  //             content: const Text('The entered email is already registered.'),
  //             actions: [
  //               TextButton(
  //                 child: const Text('OK'),
  //                 onPressed: () => Navigator.pop(context),
  //               ),
  //             ],
  //           ),
  //         );
  //       } else {
  //         // Navigate to the home page or perform any necessary actions after successful signup
  //       }
  //     }
  //   } catch (e) {
  //     if (e is FirebaseAuthException) {
  //       if (e.code == 'invalid-email') {
  //         // Handle the badly formatted email error
  //         showDialog(
  //           context: context,
  //           builder: (context) => AlertDialog(
  //             backgroundColor: Colors.white,
  //             title: const Text('Invalid Email'),
  //             content: const Text('Please enter a valid email address.'),
  //             actions: [
  //               TextButton(
  //                 child: const Text('OK'),
  //                 onPressed: () => Navigator.pop(context),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //     }
  //   }
  // }
  Future<void> _signUp() async {
    try {
      if (_formkey.currentState!.validate()) {
        setState(() {});
        await _auth.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim(),
        );
        // Navigate to the home page or perform any necessary actions after successful signup
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          setState(() {});
          // Handle the badly formatted email error
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Invalid Email'),
              content: const Text('Please enter a valid email address.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Signup',
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
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                      controller: _emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye),
                          prefixIcon: Icon(Icons.lock_open),
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                        controller: _passwordcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BottomText(
              ontap: _signUp,
              // ontap: () {
              //   if (_formkey.currentState!.validate()) {
              //     _auth
              //         .createUserWithEmailAndPassword(
              //           email: _emailcontroller.text.toString(),
              //           password: _passwordcontroller.text.toString(),
              //         )
              //         .then((value) {})
              //         .onError((error, stackTrace) {
              //       utilies().toastMessages("Hello wrong Messages");
              //     });
              //     // Navigate to the home page or perform any necessary actions after successful signup
              //   }
              // },
              title: 'Sign up',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Loginscreen(),
                    ),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
