//import 'package:cookin/view/login/welcome_view.dart';
//import 'package:cookin/view/login/welcome_view.dart';
//import 'package:cookin/view/login/welcome_view.dart/welcome_view.dart';
import 'package:cookinapp_01/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

//import '../login/welcome_view.dart';
//
//import 'package:food_delivery/view/main_tabview/main_tabview.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 8));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomeView()));
    welcomePage();
  }

  void welcomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomeView()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/spalsh_bg1.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/img/app_logo.png",
            width: media.width * 0.55,
            height: media.height * 0.55,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
