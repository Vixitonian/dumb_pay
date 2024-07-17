// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dumb_pay/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEmailScreen extends StatefulWidget {
  const AddEmailScreen({super.key});

  @override
  State<AddEmailScreen> createState() => _AddEmailScreenState();
}

class _AddEmailScreenState extends State<AddEmailScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Create a DumbPay Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.trim().isNotEmpty) {
                      context
                          .read<AuthProvider>()
                          .getEmailToken(context, emailController.text.trim());
                    } else {
                      print('Email field is Empty');
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Email field is Empty")));
                    }
                  },
                  child: Text('Sign Up')),
            )
          ],
        ),
      ),
    );
  }
}
