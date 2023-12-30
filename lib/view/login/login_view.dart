import 'package:cookinapp_01/common/color_extension.dart';
import 'package:cookinapp_01/common_widget/round_button.dart';
import 'package:cookinapp_01/common_widget/round_icon_buton.dart';
import 'package:cookinapp_01/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
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
                "Login",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Add your details to login",
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
                hinText: "Your Email",
                controller: txtEmail,
                keyboardtype: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextfield(
                hinText: " Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(title: "Login", onPressed: () {}),
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
              const SizedBox(
                height: 30,
              ),
              Text(
                "or Login With",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundIconButton(
                icon: "assets/img/facebook_logo.png",
                title: "Login With Facebook",
                color: const Color.fromARGB(255, 69, 61, 224),
                onPressed: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              RoundIconButton(
                icon: "assets/img/google_logo.png",
                title: "Login With Google",
                color: const Color(0xffDD4B39),
                onPressed: () {},
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Signup",
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
}
