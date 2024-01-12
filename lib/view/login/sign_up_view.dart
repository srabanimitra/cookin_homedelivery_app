import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../on_boarding/on_boarding_view.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  // ignore: unused_field
  String _email = "";
  // ignore: unused_field
  String _password = "";
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 235, 201, 82),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Color.fromARGB(255, 240, 3, 3)),
            ),
          ),
        );
      },
    );
  }

  void _handleSignUp() async {
    try {
      if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text,
          password: _passwordcontroller.text,
        );
      } else if (_formkey.currentState!.validate()) {
        auth.createUserWithEmailAndPassword(
          email: _emailcontroller.text.toString(),
          password: _passwordcontroller.text.toString(),
        );
      } else {
        showErrorMessage("Passwords dont match");
      }
      //pop navigator
    } on FirebaseAuthException catch (e) {
      //pop navigator
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    //  var media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(223, 215, 71, 9),
          title: const Text("Sign Up"),
        ),
        backgroundColor: Color.fromARGB(255, 235, 201, 82),
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
                        return "Please Enter Your Email";
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
                  TextFormField(
                    controller: _confirmpasswordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: " Confirm Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your password Again";
                      } else if (_passwordcontroller.text !=
                          _confirmpasswordcontroller.text) {
                        return "Please Enter Your password Correctly";
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
                        _handleSignUp();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingView(),
                          ),
                        );
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
