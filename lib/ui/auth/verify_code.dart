import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  final verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId,});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Code'),
      ),

    );
  }
}
