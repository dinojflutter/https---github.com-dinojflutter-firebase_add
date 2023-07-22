import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_new1/Pages/post_screen.dart';
import 'package:flutter/material.dart';

import '../../Utilies/utilies.dart';
import 'Botton_text.dart';

class VerifyCode extends StatefulWidget {
  final String VerificationId;

  const VerifyCode({required this.VerificationId, super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
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
          "Verify Code",
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
                    prefixIcon: Icon(Icons.remove_red_eye),
                    hintText: " 6 digit code "),
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
                ontap: () async {
                  setState(() {
                    loading = true;
                  });
                  final _credential = PhoneAuthProvider.credential(
                    verificationId: widget.VerificationId,
                    smsCode: _phonenumbercontroller.text.toString(),
                  );
                  try {
                    await auth.signInWithCredential(_credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Postscreen()));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    utilies().toastMessages(e.toString());
                  }
                },
                title: "Verify"),
          ),
        ],
      ),
    );
  }
}
