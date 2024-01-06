//import 'package:cookinapp_01/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  String _email = "";
  String _password = "";
  void _handleSignUp() async {
    try {
      UserCredential userCredentia = await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

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
          title: Text("Sign In"),
        ),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _handleSignUp();
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
 /*
class _SignUpViewState extends State<SignUpView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  // TextEditingController txtName = TextEditingController();
  //TextEditingController txtMobile = TextEditingController();
  //TextEditingController txtAddress = TextEditingController();

  // TextEditingController txtEmail = TextEditingController();
  //TextEditingController txtPassword = TextEditingController();
  //TextEditingController txtConfirmPassword = TextEditingController();
  
 @override
  Widget build(BuildContext context) {
    //  var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "SignUp",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Add your details to Sign Up",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                controller: _namecontroller,
                hinText: "Name",
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hinText: "Phone No",
                controller: txtMobile,
                keyboardtype: TextInputType.phone,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hinText: "Address",
                controller: txtAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                controller: _emailcontroller,
                hinText: "Email",
                keyboardtype: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextfield(
                controller: _passwordcontroller,
                hinText: " Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hinText: "Confirm Password",
                controller: txtConfirmPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Sign Up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpView(),
                      ),
                    );
                  }),
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
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    String name = _namecontroller.text;
    String email = _emailcontroller.text;
    String password = _passwordcontroller.text;
    User? user = await _auth.signupWithEmailAndPassword(email, password);
    if (user != null) {
      print("user is successfully creater");
      Navigator.pushNamed(context, "home");
    } else {
      print("some error occured");
    }
  }
}
*/