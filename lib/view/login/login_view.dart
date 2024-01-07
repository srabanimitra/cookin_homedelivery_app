//import 'package:cookinapp_01/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../on_boarding/on_boarding_view.dart';
import 'reset_password_view.dart';
//import '../../common/color_extension.dart';
//import '../../common_widget/round_button.dart';
//import '../../common_widget/round_textfield.dart';
//import 'login_view.dart';
//import 'otp_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  String _email = "";
  String _password = "";
  void _handleLogin() async {
    try {
      UserCredential userCredentia = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print("User Logged In : ${userCredentia.user!.email}");
    } catch (e) {
      print("Error During Logged In: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    //  var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Email Here";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your password";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _handleLogin();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnBoardingView(),
                            ),
                          );
                        }
                      },
                      child: const Text("Log In"),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordView(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
