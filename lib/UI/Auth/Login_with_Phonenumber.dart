import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_new1/UI/Auth/verify_phone.dart';
import 'package:firebase_new1/Utilies/utilies.dart';
import 'package:flutter/material.dart';

import 'Botton_text.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  bool loading = false;
  TextEditingController _phonenumbercontroller = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Phone Number",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xfff1f1f1),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phonenumbercontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone),
                    hintText: "+977 9800000001"),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5),
            child: BottomText(
                loading: loading,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                    phoneNumber: _phonenumbercontroller.text,
                    verificationCompleted: (_) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        loading = false;
                      });
                      utilies().toastMessages(e.toString());
                    },
                    codeSent: (String VerificationId, int? token) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyCode(
                                    VerificationId: VerificationId,
                                  )));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      setState(() {
                        loading = false;
                      });
                      utilies().toastMessages(e.toString());
                    },
                  );
                },
                title: "Login"),
          ),
        ],
      ),
    );
  }
}
