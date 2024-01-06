//import 'package:cookinapp_01/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../on_boarding/on_boarding_view.dart';
//import '../../common/color_extension.dart';
//import '../../common_widget/round_button.dart';
//import '../../common_widget/round_textfield.dart';
//import 'login_view.dart';
//import 'otp_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  String _email = "";
  String _password = "";
  void _handleSignUp() async {
    try {
      if (_passwordcontroller == _confirmpasswordcontroller) {
        UserCredential userCredentia =
            await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      }

      var userCredentia;
      print("User Registered : ${userCredentia.user!.email}");
    } catch (e) {
      print("Error During Registration : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    //  var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
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
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              )),
        ));
  }
}
