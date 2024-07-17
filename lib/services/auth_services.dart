import 'package:dumb_pay/models/api_result.dart';
import 'package:dumb_pay/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<ApiResult> getEmailToken(String email) async {
    String url = ApiEndpoints.baseUrl + ApiEndpoints.getEmailToken;

    try {
      http.Response response =
          await http.post(Uri.parse(url), body: {"email": email});

      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: "Email Token Sent Successfully",
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: "Failed to send token",
            response: response);
      }
    } catch (e) {
      print("Error: $e");
      return ApiResult(success: false, message: "An Error Occurred");
    }
  }

  static Future<ApiResult> verifyEmailToken(
      {required String email, required String token}) async {
    String url = ApiEndpoints.baseUrl + ApiEndpoints.verifyEmail;

    try {
      http.Response response = await http
          .post(Uri.parse(url), body: {"email": email, "token": token});

      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: "Email verified Successfully",
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: "Failed to verify Email",
            response: response);
      }
    } catch (e) {
      print("Error: $e");
      return ApiResult(success: false, message: "An Error Occurred");
    }
  }

  static Future<ApiResult> register(
      {required String email,
      required String fullName,
      String username = '',
      required String countryCode,
      required String password,
      required String deviceName}) async {
    String url = ApiEndpoints.baseUrl + ApiEndpoints.register;

    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        "email": email,
        "full_name": fullName,
        "username": username,
        "country": countryCode,
        "password": password,
        "device_name": deviceName
      });

      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: "Registerd Successfully",
            response: response);
      } else {
        return ApiResult(
            success: false, message: "Failed to register ", response: response);
      }
    } catch (e) {
      print("Error: $e");
      return ApiResult(success: false, message: "An Error Occurred");
    }
  }
}
