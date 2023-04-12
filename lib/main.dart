import 'package:flutter/material.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_birthdate.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_email.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_gender.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_name.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SignUpName.routeName: (context) => const SignUpName(),
        BirthDateSignUp.routeName: (context) => const BirthDateSignUp(),
        SignUpGender.routeName: (context) => const SignUpGender(),
        SignUpEmail.routeName: (context) => const SignUpEmail(),
        SignUpPassword.routeName: (context) => const SignUpPassword(),
      },
      home: const SignUpName(),
    );
  }
}
