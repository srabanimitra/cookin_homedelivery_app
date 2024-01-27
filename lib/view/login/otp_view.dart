import 'package:cookinapp_01/view/on_boarding/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../utils/utils.dart';

class OtpView extends StatefulWidget {
  final String verificationId;
  const OtpView({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  bool loading = false;

  final VerificationCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: VerificationCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '6 digit code'),
            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(
              title: 'Verify',
              onPressed: () async {
                final Credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: VerificationCodeController.text.toString());
                try {
                  await auth.signInWithCredential(Credential);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnBoardingView()));
                } catch (e) {
                  utils().toastMessage(e.toString());
                }
              },
              loading: true,
            )
          ],
        ),
      ),
    );
  }
}
