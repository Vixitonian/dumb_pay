// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;

class ApiResult {
  bool success = false;
  String? message;
  http.Response? response;

  ApiResult({
    required this.success,
    this.message,
    this.response,
  });
}
