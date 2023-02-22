import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_shredprefrence/views/screens/signup.dart';
import 'package:signin_shredprefrence/views/utils/sf_utils.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String User = "NoUser";

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      User = prefs.getString(SfUserName) ?? "NoUser";
    });
  }

  DeleteAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SfLogin, false);
    // prefs.setString(SfUserName, Username!);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUp_Page(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUser();
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
          child: Column(
            children: [
              Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://img.freepik.com/free-vector/sign-up-concept-illustration_114360-7895.jpg?w=740&t=st=1677060465~exp=1677061065~hmac=66f91fa9f3348f5a883af41e4622df1036255e20056e01ce83cc5774860e76af",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue.shade800,
                        Colors.blue.shade600,
                        Colors.blue.shade300,
                      ]),
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
                    child: Text(
                      "Login as $User's",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
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
                    DeleteAccount();
                  },
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
