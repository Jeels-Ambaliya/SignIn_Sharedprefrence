import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_shredprefrence/views/screens/user.dart';

import '../utils/sf_utils.dart';

class SignIn_Page extends StatefulWidget {
  final String UserName;
  final String Pswd;
  const SignIn_Page({
    Key? key,
    required this.Pswd,
    required this.UserName,
  }) : super(key: key);

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  bool Obsecured = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SfLogin, true);
    prefs.setString(SfUserName, widget.UserName);

    Navigator.of(context).push(
      MaterialPageRoute(
        //home
        builder: (context) => const UserPage(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 18,
          right: 18,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-vector/employer-meeting-job-applicant-pre-employment-assessment-employee-evaluation-assessment-form-report-performance-review-concept-illustration_335657-2058.jpg?w=996&t=st=1677060206~exp=1677060806~hmac=d3a9af568deb7f1971acf1a35083cabf8670d98d3e7498be57ea951a1771c5ae",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: TextFormField(
                    validator: (val) {
                      if (val != widget.UserName) {
                        return "Enter Valid Username";
                      }
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: TextFormField(
                    validator: (val) {
                      if (val != widget.Pswd) {
                        return "Enter Valid Password";
                      }
                    },
                    obscureText: Obsecured,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            Obsecured = !Obsecured;
                          });
                        },
                        icon: Icon(
                          Obsecured ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        SignIn();
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 0.5,
                            blurRadius: 15,
                            color: Colors.grey,
                          ),
                        ],
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
