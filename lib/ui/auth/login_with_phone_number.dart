import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/ui/auth/verify_code.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:firebase_sample/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with phone'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "+1 234 3455 234"),
            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(
                title: 'Login',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading=true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text.toString(),
                      verificationCompleted: (_) {
                        setState(() {
                          loading=false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading=false;
                        });
                        Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyCodeScreen(
                                  verificationId: verificationId),

                            ));
                        setState(() {
                          loading=false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().toastMessage(e.toString());
                        setState(() {
                          loading=false;
                        });
                      });
                }),
          ],
        ),
      ),
    );
  }
}
