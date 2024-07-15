import 'package:dumb_pay/screens/auth/add_bio_screen.dart';
import 'package:dumb_pay/screens/auth/verify_email_screen.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  signUp(BuildContext context, String email) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => VerifyEmailScreen()));
  }

  verifyEmail(BuildContext context, String code) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddBioScreen()));
  }

  finalSignUp(BuildContext context,
      {required String fullName,
      String username = '',
      required String countryCode,
      required String password}) {}
}
