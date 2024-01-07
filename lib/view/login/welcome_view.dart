import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import 'login_view.dart';
import 'sign_up_view.dart';
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
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("assets/img/welcome_top_shape.png",
                  width: media.width),
              Image.asset(
                "assets/img/app_logo.png",
                width: media.width * 0.56,
                height: media.width * 0.54,
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Text(
            "Discover the best foods from over 100\n homechef and fast delivery to your\n doorstep",
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
              title:"Login",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>const LoginView(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(

              title: "SignUp",


              type: RoundButtonType.textPrimary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpView(),
                  ),
                );
              },
            ),
          ),
          /* SizedBox(
            height: media.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "SignUp As A Chef",
              type: RoundButtonType.textPrimary,
              onPressed: () {},
            ),
          ),*/
        ],
      ),
    );
  }
}
