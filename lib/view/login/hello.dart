/*import 'package:cookinapp_01/view/login/sign_up_view.dart';
import 'package:cookinapp_01/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

import 'welcome_view.dart';

class hello extends SignUpView {
  const hello({super.key});
  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("assets/img/brown-nuts-and-pinecone-lot-iphone.jpg",
                  width: media.width),
            ],
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Text(
            "WELCOME",
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
              title: "SignOut",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeView(),
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
              title: "Start",
              type: RoundButtonType.textPrimary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/