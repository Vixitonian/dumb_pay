// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:country_picker/country_picker.dart';
import 'package:dumb_pay/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBioScreen extends StatefulWidget {
  const AddBioScreen({super.key});

  @override
  State<AddBioScreen> createState() => _AddBioScreenState();
}

class _AddBioScreenState extends State<AddBioScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String countryCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Hey there! tell us a bit about yourself',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(hintText: "Full Name"),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username (Optional)",
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: countryController,
                readOnly: true,
                onTap: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (country) {
                        print(country.countryCode);
                        setState(() {
                          countryCode = country.countryCode;
                          countryController.text = country.name;
                        });
                      });
                },
                decoration: InputDecoration(hintText: "Country"),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (fullNameController.text.trim().isNotEmpty &&
                        countryCode.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty) {
                      context.read<AuthProvider>().finalSignUp(context,
                          fullName: fullNameController.text.trim(),
                          username: usernameController.text.trim(),
                          countryCode: countryCode,
                          password: passwordController.text.trim());
                    } else {
                      print("Fill All Details");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Fill all fields")));
                    }
                  },
                  child: Text('Finish Up')),
            )
          ],
        ),
      ),
    );
  }
}
