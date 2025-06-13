import 'package:flutter/material.dart';
import 'package:streamline/Screens/SignIn_Screen.dart';
import 'package:streamline/Screens/SignUp_Screen.dart';
import 'package:streamline/Screens/Welcome_Screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(), // Change to SignUpScreen() to test the signup screen
    );
  }
}