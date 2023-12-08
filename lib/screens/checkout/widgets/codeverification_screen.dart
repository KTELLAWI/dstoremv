// code_verification_screen.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CodeVerificationScreen extends StatefulWidget {
  final String verificationId;

  CodeVerificationScreen({required this.verificationId});

  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithPhoneNumber(String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
      // Phone number successfully verified, close the bottom modal sheet
      Navigator.pop(context);
      // You can also navigate to the next screen or perform other actions
    } catch (e) {
      // Handle verification failure
      print("Error during phone number verification: $e");
      // You can also show an error message to the user
    }
  }

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        //  mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter SMS Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final smsCode = _codeController.text.trim();
                _signInWithPhoneNumber(smsCode);
              },
              child: Text('Verify Code'),
            ),
          ],
        ),
      ),
    );
  }
}