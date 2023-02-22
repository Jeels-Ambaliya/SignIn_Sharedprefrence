import 'package:flutter/material.dart';

import 'views/screens/signup.dart';

void main() {
  runApp(
    const SignUp_SignIn(),
  );
}

class SignUp_SignIn extends StatefulWidget {
  const SignUp_SignIn({Key? key}) : super(key: key);

  @override
  State<SignUp_SignIn> createState() => _SignUp_SignInState();
}

class _SignUp_SignInState extends State<SignUp_SignIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignUp_Page(),
    );
  }
}
