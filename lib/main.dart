import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyAcXxfm-OENcT2HGNiNJv79phTxCT27Xhk',
          appId: '1:108148454657:android:812af1a082bba0f4615700',
          messagingSenderId: '108148454657',
          projectId: 'fir-sample-59815',
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    print("Error initializing Firebase: $e");
    // Handle the error as needed, e.g., show an error message to the user.
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const SplashScreen(),
    );
  }
}
