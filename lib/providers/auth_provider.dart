import 'package:dumb_pay/models/api_result.dart';
import 'package:dumb_pay/screens/auth/add_bio_screen.dart';
import 'package:dumb_pay/screens/auth/verify_email_screen.dart';
import 'package:dumb_pay/screens/home/home_screen.dart';
import 'package:dumb_pay/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  var email = '';

  saveEmail(String value) {
    email = value;
    notifyListeners();
  }

  getEmailToken(BuildContext context, String email) async {
    ApiResult result = await AuthServices.getEmailToken(email);
    if (result.success == true) {
      print(result.response!.body);
      saveEmail(email);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => VerifyEmailScreen()));
    } else {
      print(result.message);
    }
  }

  verifyEmail(BuildContext context, String code) async {
    ApiResult result =
        await AuthServices.verifyEmailToken(email: email, token: code);
    if (result.success == true) {
      print(result.message);
      print(result.response!.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AddBioScreen()));
    } else {
      print(result.message);
      (result.response == null)
          ? print("An error occurred")
          : print(result.response!.body);
    }
  }

  register(BuildContext context,
      {required String fullName,
      String username = '',
      required String countryCode,
      required String password}) async {
    ApiResult result = await AuthServices.register(
        email: email,
        fullName: fullName,
        username: username,
        countryCode: countryCode,
        password: password,
        deviceName: "mobile");
    if (result.success == true) {
      print(result.message);
      print(result.response!.body);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      print(result.message);
      (result.response == null)
          ? print("An error occurred")
          : print(result.response!.body);
    }
  }
}
