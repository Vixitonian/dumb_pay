import 'package:dumb_pay/providers/auth_provider.dart';
import 'package:dumb_pay/screens/auth/add_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const MaterialApp(home: AddEmailScreen()),
    );
  }
}
