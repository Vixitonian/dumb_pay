// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dumb_pay/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Verify It\'s you ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We send a code to ( *****@mail.com ). Enter it here to verify your identity",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  length: 5,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 50,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (otpController.text.trim().isNotEmpty) {
                      context
                          .read<AuthProvider>()
                          .verifyEmail(context, otpController.text.trim());
                    } else {
                      print("OTP is Empty");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("OTP is Empty")));
                    }
                  },
                  child: Text('Confirm')),
            )
          ],
        ),
      ),
    );
  }
}
