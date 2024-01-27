
import 'package:cookinapp_01/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import 'login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset("assets/img/welcome_top_shape.png",
                    width: media.width),
                Image.asset(
                  "assets/img/app_logo.png",
                  width: media.width * 0.55,
                  height: media.width * 0.55,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Text(
              "Discover the best foods from over 100\nhomechef and fast delivery to your\ndoorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                title: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginView(),
                    ),
                  );
                }, loading: true,
              ),
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                title: "Create an Account",
                type: RoundButtonType.textPrimary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpView(),
                    ),
                  );
                }, loading: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
