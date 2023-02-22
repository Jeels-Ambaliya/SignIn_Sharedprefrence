import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_shredprefrence/views/screens/signin.dart';
import 'package:signin_shredprefrence/views/screens/user.dart';
import 'package:signin_shredprefrence/views/utils/sf_utils.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({Key? key}) : super(key: key);

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  checkSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(SfLogin) ?? false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const UserPage(),
        ),
      );
    }
  }

  SignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool(SfLogin, true);
    prefs.setString(SfUserName, Username!);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignIn_Page(Pswd: Pswd!, UserName: Username!),
      ),
    );
  }

  bool Obsecured = true;

  String? Username;
  String? Email;
  String? Pswd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSignIn();
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
                height: 270,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://img.freepik.com/free-vector/global-data-security-personal-data-security-cyber-data-security-online-concept-illustration-internet-security-information-privacy-protection_1150-37336.jpg?w=740&t=st=1677056023~exp=1677056623~hmac=c819cbb0691043d4338b35f854773dfe43779a5faab5f440219d3ff5982b60ce",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CREATE",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "  ACCOUNT",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue.shade500,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      Username = val;
                    });
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
                  onChanged: (val) {
                    setState(() {
                      Email = val;
                    });
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
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
                  onChanged: (val) {
                    setState(() {
                      Pswd = val;
                    });
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
                  onTap: () => SignIn(),
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
                      "Sign Up",
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
    );
  }
}
