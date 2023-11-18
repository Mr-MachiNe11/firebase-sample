import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/posts/post_screen.dart';
import 'package:firebase_sample/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {

  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    //login
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PostScreen()),
        );
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    }
  }
}
