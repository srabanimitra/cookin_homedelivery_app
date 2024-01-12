import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
//import 'new_password_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
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
                "Reset Password",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "please enter your email to receive a link to reset your password via email",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              RoundTextfield(
                hintText: "Your Email",
                controller: _emailcontroller,
                keyboardtype: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                title: "Send",
                onPressed: () {
                  auth
                      .sendPasswordResetEmail(
                          email: _emailcontroller.text.toString())
                      .then((value) {
                    print(
                        'We Have Sent You Email to Recover Password,Please Check Email');
                  }).onError((error, stackTrace) {
                    print("Enter Your Email Correctly");
                  });
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewPasswordView(),
                      ),
                    );*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
